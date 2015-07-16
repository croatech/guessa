namespace :import do
  desc "Import movie list"
  task :movies => :environment do

    connection = Fog::Storage.new({
      :provider                 => 'AWS',
      :aws_access_key_id        => ENV['S3_ACCESS_KEY_ID'],
      :aws_secret_access_key    => ENV['S3_SECRET_ACCESS_KEY']
    })

    directory = connection.directories.create(
      :key    => "guessapp", # globally unique name
      :public => true
    )

    agent = Mechanize.new
    base_url = "https://www.themoviedb.org/movie"
    base_images_url = "https://image.tmdb.org/t/p/w780/"

    while(true) do
      next_link = base_url + "?page=" + (defined?($next_link_id) ? $next_link_id.to_s : 1.to_s)
      page = agent.get(next_link) # redirect to next_page

      $next_link_id = next_link.split("=")[1].to_i + 1 if next_link # id of next page
      if $next_link_id == 1000 then break end # last page

      page.search(".card").each do |item|
        title = item.search(".info .title").text
        year = item.search(".release_date").text[/[0-9]+/]
        rating = item.search(".vote_average").text

        # only movies rating greater than 6 and year > 1970
        if rating.to_f < 6 || year.to_i < 1970 then next end

        # get image
        movie_id = item.search(".info .title").first["href"].split("/")[2] # get movie ID from url
        movie_page = agent.get(base_url + "/" + movie_id.to_s) # redirect to current movie page

        if movie_page.search(".lightbox").first["src"] # if screenshot exists
          image = movie_page.search(".lightbox").first # get first screenshot
          movie_image_name = image["src"].split("/")[-1] # get filename
          movie_image_url = base_images_url + movie_image_name
          agent.get(movie_image_url).save "./public/system/movies/images/" + movie_image_name

          absolute_local_path_to_image = "./public/system/movies/images/" + movie_image_name
        else
          next
        end

        file = directory.files.create(
          :key    => movie_image_name,
          :body   => File.open(absolute_local_path_to_image),
          :public => true
        )

        File.delete(absolute_local_path_to_image)

        if Movie.create(title: title, year: year, image_file_name: directory.key + "/" + movie_image_name,
                        image_content_type: "image/jpeg")
          puts "#{title} | ".light_blue + "Done!".green
        else
          puts "#{title} | Fail!".red
        end

        sleep(3)
      end
    end
  end
end
