namespace :import do
  desc "Import movie list"
  task :movies => :environment do

    agent = Mechanize.new
    url = "https://www.themoviedb.org/movie"
    base_image_url = "https://image.tmdb.org/t/p/w780/"

    while(true) do
      next_link = url + "?page=" + (defined?($next_link_id) ? $next_link_id.to_s : 1.to_s)
      page = agent.get(next_link) # redirect to next_page
      $next_link_id = next_link.split("=")[1].to_i + 1 if next_link # id of next page

      page.search(".card").each do |item|
        title = item.search(".info .title").text
        year = item.search(".release_date").text[/[0-9]+/]

        # get image
        movie_id = item.search(".info .title").first["href"].split("/")[2] # get movie ID from url
        movie_page = agent.get(url + "/" + movie_id.to_s) # redirect to current movie page

        image = movie_page.search(".lightbox").first # get first screenshot
        movie_image_name = image["src"].split("/")[-1]
        movie_image_url = base_image_url + movie_image_name
        agent.get(movie_image_url).save "./movies/" + movie_image_name

        if Movie.create(title: title, year: year)
          puts "#{title} | ".light_blue + "Done!".green
        else
          puts "#{title} | Fail!".red
        end

        sleep(3)
      end
    end
  end
end