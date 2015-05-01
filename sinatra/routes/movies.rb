require "sinatra/activerecord"
require_relative "../models/init"

namespace '/movies' do
  @title = "Movies"
  @r_count = 0

  get '' do
    @movie = Movie.order("RANDOM()").first()
    @options = Movie.where.not(id: @movie.id).order("RANDOM()").first(3).to_a << @movie

    haml :movies, layout: :layout
  end

  post '' do
  end
end