require "sinatra/activerecord"
require_relative "movie"
require_relative "star"

set :database, { adapter: "postgresql", 
                 database: "flamingo_development",
                 username: "flamingo",
                 host: "localhost", 
                 password: "flamingo" }