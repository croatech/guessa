require 'sinatra'
require "sinatra/activerecord"
require "sinatra/namespace"
require 'haml'

class GuessApp < Sinatra::Base
  register Sinatra::Namespace
  register Sinatra::ActiveRecordExtension

  enable :sessions

  configure :production do
    set :haml, { :ugly=>true }
    set :clean_trace, true
  end

  configure :development do
    # ...
  end

  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end
end

require_relative 'routes/init'
require_relative 'models/init'
require_relative 'helpers/init'