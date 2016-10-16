#The Database editing file

#Importing stuff
require 'sinatra'
require 'sinatra/activerecord'
require './environments'


@Exchangedb = SQLite3::Database.new('MemeExchange.db')

#Names:
#Harambe
#Pepe

#Methods for Memes

#Return Meme_ID method
def meme_id_return(name)
  if name.eql?('Doge')
    return 01
  elsif name.eql?('Harambe')
    return 02
  elsif name.eql?('Pepe')
    return 03
  elsif name.eql?('Spongebob')
    return 04
  elsif name.eql?('Xzibit')
    return 05
  else
    puts "error shit"
    return "error"
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

#Methods to edit the user account data

#Method to retrive account money
def account_money(name,db)
    money = db.execute(
    'SELECT AccountMoney FROM Users WHERE UserName = ?',
	[name]
  )
  return money
end

#Method to update account money
def account_money_update(name,db,money)
   db.execute(
    'UPDATE Users SET AccountMoney = ? WHERE Name = ?',
	[money,name]
  )
end




#TESTING CODE
#cool = gets.chomp

#puts meme_idreturn(cool)