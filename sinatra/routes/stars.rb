class GuessApp < Sinatra::Base
  namespace '/stars' do
    get '' do
      @title = "Stars"
      haml :stars, layout: :layout
    end
  end
end
