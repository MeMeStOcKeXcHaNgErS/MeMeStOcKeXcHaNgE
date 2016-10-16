
class MemeController < AppController
  get '/' do
    puts "SOMEONE WANTS MEMES!!!!!!!!!!!!"
	erb :meme
  end
end
