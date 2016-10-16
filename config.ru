require 'rubygems'
require 'sinatra'
require './app'
Dir.glob('./{models,helpers,controllers}/*.rb').each { |file| require file }

map "/" do
  run MemeStockExchangeApp
end

map "/meme" do
  run MemeController
end

map "/user" do
  run UserController
end
