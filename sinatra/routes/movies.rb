class GuessApp < Sinatra::Base
  namespace '/movies' do
    @title = 'Movies'

    get '' do
      if !session['user_name']
        redirect '/'
      end

      haml :'movies/index', layout: :layout
    end

    get '/game' do
      if !session['user_name']
        redirect '/'
      end

      if session['game'] != 'started' && session['game'] != 'finished' # if the game hasn't been started
        game = Game.create!(user_name: session['user_name'])
        session['game'] = 'started' # the game has been started
        session['game_id'] = game.id
      end

      @game = Game.find(session['game_id']) # current game
      @movie = Movie.order("RANDOM()").first() # movie for game
      @movies = Movie.where.not(id: @movie.id).order("RANDOM()").first(3).to_a << @movie # other options + current movie

      haml :'movies/game', layout: :layout
    end

    post '/game' do # check for correct answer
      if !session['user_name']
        redirect '/'
      end

      @game = Game.find(session['game_id'])

      if params[:id] == params[:answer_id]
        @game.right_answer # increment score
        redirect '/movies/game'
        flash[:success] = 'Правильный ответ!'
      else
        session['game'] = 'finished' # the game has been finished
        redirect '/movies/game'
        flash[:error] = 'Неправильный ответ!'
      end
    end

    get '/game/next_one' do
      session['game'] = 'prepared'
      redirect 'movies/game'
    end
  end
end