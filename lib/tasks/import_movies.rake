namespace :import do
  desc "Import movie list"
  task :movies => :environment do

    agent = Mechanize.new
    url = "https://www.themoviedb.org/movie"

    while(true) do
      next_link = url + "?page=" + (defined?($next_link_id) ? $next_link_id.to_s : 1.to_s)
      page = agent.get(next_link) # redirect to next_page
      $next_link_id = next_link.split("=")[1].to_i + 1 if next_link

      page.search(".card").each do |item|
        title = item.search(".info .title").text
        year = item.search(".release_date").text[/[0-9]+/]
        #image = item.search(".image_content .poster").map{ |link| link['src'] }

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