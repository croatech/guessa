class GuessApp < Sinatra::Base
  namespace '/stars' do
    get '' do
      @title = 'Stars'
      haml :'stars/index', layout: :layout
    end
  end
end
