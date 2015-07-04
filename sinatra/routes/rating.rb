class GuessApp < Sinatra::Base
  namespace '/rating' do
    @title = 'Rating'

    get '' do
      haml :'rating/index', layout: :layout
    end
  end
end