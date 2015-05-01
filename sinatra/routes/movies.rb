require "sinatra/activerecord"
require_relative "../models/init"

namespace '/movies' do
  @title = "Movies"

  get '' do
    @movie = Movie.order("RANDOM()").first()
    @options = Movie.where.not(id: @movie.id).order("RANDOM()").first(3).to_a << @movie

    haml :movies, layout: :layout
  end

  get '/check/:id' do
    "Hello World#{params[:id]}"
  end
end