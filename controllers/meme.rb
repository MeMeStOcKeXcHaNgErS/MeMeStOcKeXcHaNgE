require './helpers/DBMethods'

class MemeController < AppController
  get '/' do
    puts "SOMEONE WANTS MEMES!"
    @meme_description = meme_description_return(params[:meme_name])[0][0]
    erb :meme
  end
  
  post '/' do
    puts "TRANSACTION MADE!"
    @meme_description = meme_description_return(params[:meme_name])[0][0]
    erb :meme
  end
end
