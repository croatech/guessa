require "sinatra"
require "sinatra/base"
require_relative "routes/init"
require_relative "models/init"

class Guess < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end
