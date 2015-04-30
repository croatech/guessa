get '/actors' do
  @title = "Actors"
  haml :actors, layout: :layout
end