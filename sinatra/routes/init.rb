require_relative "movies"
require_relative "stars"

class GuessApp < Sinatra::Base
  get '/' do
    haml :index, layout: :layout
  end

  get '/choose' do
  	haml :choose, layout: :layout
  end

  post '/choose' do
  	redirect "/choose"
  end
end