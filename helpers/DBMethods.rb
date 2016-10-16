#The Database editing file

#Importing stuff
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'

#Names:
#Harambe
#Pepe
#doge
#Xzibit

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


#Methods to access meme shares

#Method to access number of a given meme share given username
def share_number(user,meme)
  stockNo = $database.execute(
    'SELECT Meme_NO FROM MemeShares WHERE UserName = ? && Name = ?',
	[user,meme]
  )
  return stockNo
end

#Method to change share count of a given meme and username
def share_edit(user,meme,stock)
     $database.execute(
    'UPDATE MemeShares SET Meme_NO = ? WHERE UserName = ? && Name = ?',
	[stock,user,meme]
  )
end


#Higher Level Methods

#Buy 1 meme
def meme_buy_sell(user,meme,stock) 
  if account_money(name) < (meme_currentprice_return(meme)*stock)
	return "error not enough money"
  elsif  share_number(user,meme) + stock < 0
	return "error not enough stock to sell"
  elsif stock == 0
    #we do nothing :D
  else
	#Updating stock
	share_edit(user,meme,(stock+share_number(user,meme)
	#Updating cash
	account_money_update(user,(account_money(name)-(stock*meme_currentprice_return(meme))))
end
	
	


#TESTING CODE
#cool = gets.chomp

#puts meme_idreturn(cool)