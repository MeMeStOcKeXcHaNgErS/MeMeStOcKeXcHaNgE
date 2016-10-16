require './helpers/DBMethods'

class MemeController < AppController
  @db = SQLite3::Database.new('MemeExchange.db')
  
  get '/' do
    puts "SOMEONE WANTS MEMES!"
    @meme_description = meme_description_return(params[:meme_name],@db)
    erb :meme
  end
end
