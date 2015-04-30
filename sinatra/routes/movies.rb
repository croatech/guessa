require "sinatra/activerecord"
require_relative "../models/init"

get '/movies' do
  @title = "Movies"
  @movie = Movie.find(2)
  haml :movies, layout: :layout
end