class MoviesController < ApplicationController
  #def index
  #	random_year = Movie.all.order("RANDOM()").first().year
  #  @movies = Movie.all.order("RANDOM()").where(year: random_year).limit(4)
  #end

   def index
    @movies = Movie.all

    respond_to do |format|
      format.json do
        render :json => @movies.to_json
      end
    end
  end
end
