require "sinatra"
require "sinatra/base"
require "sinatra/activerecord"
require_relative "routes/init"

class Guess < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end

set :database, { adapter: "postgresql", 
                 database: "flamingo",
                 username: "flamingo",
                 host: "localhost", 
                 password: "flamingo" }