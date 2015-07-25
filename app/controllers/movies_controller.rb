class MoviesController < ApplicationController
  def index
  	random_year = Movie.all.order("RANDOM()").first().year
    @movies = Movie.all.order("RANDOM()").where(year: random_year).limit(4)
  end
end