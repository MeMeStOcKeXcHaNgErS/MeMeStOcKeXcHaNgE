require './helpers/DBMethods'

class MemeController < AppController
  get '/' do
    puts "SOMEONE WANTS MEMES!"
    @meme_description = meme_description_return(params[:meme_name])[0][0]
    erb :meme
  end
  
  post '/transaction' do
    stock_number = params[:transaction_amount]
    meme_buy_sell(session[:user_name],params[:meme_name],stock_number)
    redirect '/'
  end
end
