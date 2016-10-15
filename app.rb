require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'activerecord-postgresql-adapater'
require './config/environments' #database configuration
 
get '/' do
      "Hello, World!"
end