require 'sinatra'
require "sinatra/activerecord"
require "sinatra/namespace"
require 'sinatra/flash'
require 'haml'

class GuessApp < Sinatra::Base
  enable :sessions

  register Sinatra::Flash
  register Sinatra::Namespace
  register Sinatra::ActiveRecordExtension
  
  configure :production do
    set :haml, { :ugly=>true }
    set :clean_trace, true
  end

  configure :development do
    # ...
  end
end

require_relative 'routes/init'
require_relative 'models/init'
require_relative 'helpers/init'