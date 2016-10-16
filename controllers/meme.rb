require './helpers/DBMethods'

class MemeController < AppController
  get '/' do
    puts "SOMEONE WANTS MEMES!"
    @meme_description = meme_description_return(params[:meme_name])
    erb :meme
  end
end
