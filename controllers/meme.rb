require './helpers/DBMethods'
require 'twitter'
require 'omniauth'
require 'omniauth-twitter'

class MemeController < AppController
  @user_portfolio_name="CurryKing1001"
  get '/' do
    puts "SOMEONE WANTS MEMES!"
	@users_share=share_number("CurryKing1001", params[:meme_name])
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
  
  get '/frame' do
	erb :stock_frame
  end
end
