#The Database editing file

#Importing stuff
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'

#Names:
#Harambe
#Pepe

#Methods for Memes

#Return Meme_ID method

#Method to return a meme description given a name
def meme_description_return(name)
  memedscript = $database.execute(
    'SELECT Description FROM Meme WHERE Name = ?',
    [name]
  )
  return memedscript
end

#Method to return a meme current price given a name
def meme_currentprice_return(name)
  memecurrentprice = $database.execute(
    'SELECT Price FROM Meme WHERE Name = ?',
    [name]
  )
  return memecurrentprice
end

#Method to return a meme previous price given a name
def meme_previousprice_return(name)
  memepreviousprice = $database.execute(
    'SELECT PreviousPrice FROM Meme WHERE Name = ?',
    [name]
  )
  return memepreviousprice
end

#Method to change a meme price given a name
def meme_price_change(name,price)
  $database.execute(
    'UPDATE Meme SET Price = ? WHERE Name = ?',
	[price,name]
  )
end

#Method to change a meme previous price given a name
def meme_previousprice_change(name,price)
  $database.execute(
    'UPDATE Meme SET PreviousPrice = ? WHERE Name = ?',
	[price,name]
  )
end

#Methods to edit the user account data

#Method to retrive account money
def account_money(name)
    money = $database.execute(
    'SELECT AccountMoney FROM Users WHERE UserName = ?',
	[name]
  )
  return money
end

#Method to update account money
def account_money_update(name,money)
   $database.execute(
    'UPDATE Users SET AccountMoney = ? WHERE Name = ?',
	[money,name]
  )
end




#TESTING CODE
#cool = gets.chomp

#puts meme_idreturn(cool)