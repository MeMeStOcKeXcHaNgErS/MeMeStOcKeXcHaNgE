require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require './config/environments' #database configuration
require 'json'
require 'twitter'
require 'omniauth'
require 'omniauth-twitter'


class AppController < Sinatra::Base
  #Session cookies
  enable :sessions
  set :session_secret, 'super secret'

  #Views
  include ERB::Util
  set :views, File.expand_path('../../views', __FILE__)

  #Images, css, javascript etc.
  set :public_folder, File.expand_path('../../public', __FILE__)

  #Global Variables
  $CONSUMER_KEY = '6eNbUKEZgr7q29zzvoCPE6f4Y'
  $CONSUMER_SECRET = 'dV4eRYVRa6GocxlpCfZgK9Co7cBLv7isQxlYwoLUuiXOs7lOjk'

  #For Twitter Gem
  config = {
      :consumer_key => $CONSUMER_KEY,
      :consumer_secret => $CONSUMER_SECRET,
      :access_token => '702136534376570881-BqpYzpUi36ijd1ZbEMBBL4XhL4nYO7k',
      :access_token_secret => 'FxnOlhnGT4GudHvObVF5TvpFNSZQoaYE2P5CESjViZZ4K'
  }
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  #For OmniAuth Gem
  use OmniAuth::Builder do
    provider :twitter, $CONSUMER_KEY, $CONSUMER_SECRET
  end

  before do
    #Instantiate the twitter client.
    $client = Twitter::REST::Client.new(config)
    #Initialize Database If Empty
    #TODO
  end
end
