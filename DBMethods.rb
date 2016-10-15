#The Database editing file

#Importing stuff
require 'sqlite3'

@Exchangedb = SQLite3::Database.new('MemeExchange.db')

#Names:
#Harambe
#Pepe

#Methods for Memes

#Return Meme_ID method
def meme_id_return(name)
  if name.eql?('Harambe')
    return 01
  elsif name.eql?('Pepe')
    return 02
  else
    puts 'invlaid name'
	return 'error'
  end
end

#Method to return a meme name given name 
def meme_name_return(name,db)
  id = meme_id_return(name)
  memename = db.execute(
    'SELECT Name FROM Meme WHERE Meme_ID = ?',
    [id]
  )
  return memename
end

#Method to return a meme description given a name
def meme_description_return(name,db)
  id = meme_id_return(name)
  memedscript = db.execute(
    'SELECT Description FROM Meme WHERE Meme_ID = ?',
    [id]
  )
  return memedscript
end

#Method to return a meme current price given a name
def meme_currentprice_return(name,db)
  id = meme_id_return(name)
  memecurrentprice = db.execute(
    'SELECT Price FROM Meme WHERE Meme_ID = ?',
    [id]
  )
  return memecurrentprice
end

#Method to return a meme previous price given a name
def meme_previousprice_return(name,db)
  id = meme_id_return(name)
  memepreviousprice = db.execute(
    'SELECT PreviousPrice FROM Meme WHERE Meme_ID = ?',
    [id]
  )
  return memepreviousprice
end

#Method to change a meme price given a name
def meme_price_change(name,db,price)
  id = meme_id_return(name)
  db.execute(
    'UPDATE Meme SET Price = ? WHERE Meme_ID = ?',
	[price,id]
  )
end

#Method to change a meme previous price given a name
def meme_previousprice_change(name,db,price)
  id = meme_id_return(name)
  db.execute(
    'UPDATE Meme SET PreviousPrice = ? WHERE Meme_ID = ?',
	[price,id]
  )
end
  



#TESTING CODE
#cool = gets.chomp

#puts meme_idreturn(cool)