require "mechanize"
require "colorize"

namespace :import do
  desc "Import movie list"
  task :movies do

    agent = Mechanize.new
    url = "https://www.themoviedb.org/movie"
    page = agent.get(url)
    next_link = url + page.links_with(href: /page/).last.uri.to_s[/\?page=\d/] # configure next_link for each iteration

    while(next_link) do
      page.search(".w480").each do |item|
        title = item.search("h4 a").text
        year = item.search(".date").text[/[0-9]+/]
        image = item.search(".shadow").map{ |link| link['src'] }

        if Movie.create(title: title, image: image, year: year)
          puts "#{title} | ".light_blue + "Done!".green
        else
          puts "#{title} | Fail!".red
        end

        page = agent.get(next_link) # redirect to next_page
      end
    end
  end
end