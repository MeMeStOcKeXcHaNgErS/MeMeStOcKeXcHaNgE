
class MemeController < AppController
  get '/' do
    db.execute("CREATE TABLE table_name(column1 TEXT, column2 TEXT);")
    puts "SOMEONE WANTS MEMES!!!!!!!!!!!!"
    erb :meme
  end
end
