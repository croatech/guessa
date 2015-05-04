class GuessApp < Sinatra::Base
  namespace '/movies' do
    @title = "Movies"

    get '' do
      @movie = Movie.order("RANDOM()").first()
      @options = Movie.where.not(id: @movie.id).order("RANDOM()").first(3).to_a << @movie
      flash[:blah] = "You were feeling blah at #{Time.now}."

      haml :movies, layout: :layout
    end

    post '' do
      if params[:id] == params[:answer_id]
        redirect "/movies"
      else
        false
      end
    end
  end
end