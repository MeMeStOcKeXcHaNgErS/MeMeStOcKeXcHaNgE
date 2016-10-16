require './helpers/DBMethods'
require 'twitter'
require 'omniauth'
require 'omniauth-twitter'

class MemeController < AppController
  get '/' do
    puts "SOMEONE WANTS MEMES!"
    @meme_description = meme_description_return(params[:meme_name])
    erb :meme
  end
  
  post '/transaction' do
    stock_number = params[:transaction_amount]
	puts params[:name_of_meme]
	puts stock_number
    meme_buy_sell( "CurryKing1001",params[:name_of_meme],stock_number)
    redirect '/'
  end
end
