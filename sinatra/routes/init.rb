require_relative "movies"
require_relative "stars"

class GuessApp < Sinatra::Base
  get '/' do
    "Hello World"
  end
end