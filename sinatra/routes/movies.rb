require "sinatra/activerecord"
require_relative "../models/init"

get '/movies' do
  @title = "Movies"
  @movie = Movie.order("RANDOM()").first()
  @options = Movie.order("RANDOM()").first(3).to_a << @movie 

  haml :movies, layout: :layout
end