require_relative "../models/init"
require_relative "movies"
require_relative "stars"

class GuessApp < Sinatra::Base

  get '/' do
    if session['user_name']
      redirect "/choose"
    else
      haml :index, layout: :layout
    end
  end

  post '/' do # set name
    if params[:user_name] != ""
      session['user_name'] = params[:user_name]
      
      redirect "/choose"
    else
      redirect "/"
      flash[:warning] = "Enter your name."
    end
  end

  get '/choose' do
    if session['user_name']
      @games = Game.order(score: :desc).limit(10)
      haml :choose, layout: :layout
    else
      redirect "/"
    end
  end

end