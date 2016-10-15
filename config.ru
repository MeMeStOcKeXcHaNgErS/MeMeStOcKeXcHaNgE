$LOAD_PATH.unshift(File.dirname(__FILE__))
require "rubygems"
require 'example_omniauth_app'

map '/' do
  Rack::Handler.default.run(SinatraApp, :Port => 4567)
end