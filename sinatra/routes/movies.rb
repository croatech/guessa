class GuessApp < Sinatra::Base
  namespace '/movies' do
    @title = "Movies"

    get '' do
      if session['user_name']
        haml :'movies/index', layout: :layout
      else
        redirect '/'
        flash[:warning] = "What is your name?"
      end
    end

    post '' do
      if params[:id] == params[:answer_id]
        redirect '/movies'
      else
        false
      end
    end

    get '/game' do
      if session['game'] != "started" # if the game hasn't started
        game = Game.create!(user_name: session['user_name'])
        session['game'] == "started" # the game has started
      end

      @movie = Movie.order("RANDOM()").first()
      @options = Movie.where.not(id: @movie.id).order("RANDOM()").first(3).to_a << @movie
      flash[:blah] = "You were feeling blah at #{Time.now}."

      haml :'movies/game', layout: :layout
    end
  end
end