get '/movies' do
  @title = "Movies"
  haml :movies, layout: :layout
end