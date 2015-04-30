get '/stars' do
  @title = "Stars"
  haml :stars, layout: :layout
end