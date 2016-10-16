#The Database editing file

#Importing stuff
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'

<<<<<<< HEAD
=======
$Exchangedb = SQLite3::Database.new('MemeExchange.db')

>>>>>>> 47edaef7c2187f8cf52eb010b157331e466a8e16
#Names:
#Harambe
#Pepe
#doge

#Methods for Memes

#Return Meme_ID method

#Method to return a meme description given a name
def meme_description_return(name)
<<<<<<< HEAD
  memedscript = $database.execute(
=======
  memedscript = $Exchangedb.execute(
>>>>>>> 47edaef7c2187f8cf52eb010b157331e466a8e16
    'SELECT Description FROM Meme WHERE Name = ?',
    [name]
  )
  return memedscript
end

#Method to return a meme current price given a name
def meme_currentprice_return(name)
<<<<<<< HEAD
  memecurrentprice = $database.execute(
=======
  memecurrentprice = $Exchangedb.execute(
>>>>>>> 47edaef7c2187f8cf52eb010b157331e466a8e16
    'SELECT Price FROM Meme WHERE Name = ?',
    [name]
  )
  return memecurrentprice
end

#Method to return a meme previous price given a name
def meme_previousprice_return(name)
<<<<<<< HEAD
  memepreviousprice = $database.execute(
=======
  memepreviousprice = $Exchangedb.execute(
>>>>>>> 47edaef7c2187f8cf52eb010b157331e466a8e16
    'SELECT PreviousPrice FROM Meme WHERE Name = ?',
    [name]
  )
  return memepreviousprice
end

#Method to change a meme price given a name
def meme_price_change(name,price)
<<<<<<< HEAD
  $database.execute(
=======
  $Exchangedb.execute(
>>>>>>> 47edaef7c2187f8cf52eb010b157331e466a8e16
    'UPDATE Meme SET Price = ? WHERE Name = ?',
	[price,name]
  )
end

#Method to change a meme previous price given a name
def meme_previousprice_change(name,price)
<<<<<<< HEAD
  $database.execute(
=======
  $Exchangedb.execute(
>>>>>>> 47edaef7c2187f8cf52eb010b157331e466a8e16
    'UPDATE Meme SET PreviousPrice = ? WHERE Name = ?',
	[price,name]
  )
end

#Methods to edit the user account data

#Method to retrive account money
def account_money(name)
<<<<<<< HEAD
    money = $database.execute(
=======
    money = $Exchangedb.execute(
>>>>>>> 47edaef7c2187f8cf52eb010b157331e466a8e16
    'SELECT AccountMoney FROM Users WHERE UserName = ?',
	[name]
  )
  return money
end

#Method to update account money
def account_money_update(name,money)
<<<<<<< HEAD
   $database.execute(
=======
   $Exchangedb.execute(
>>>>>>> 47edaef7c2187f8cf52eb010b157331e466a8e16
    'UPDATE Users SET AccountMoney = ? WHERE Name = ?',
	[money,name]
  )
end




#TESTING CODE
#cool = gets.chomp

#puts meme_idreturn(cool)