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
  return memedscript[0][0]
end

#Method to return a meme current price given a name
def meme_currentprice_return(name)
  memecurrentprice = $database.execute(
    'SELECT Price FROM Meme WHERE Name = ?',
    [name]
  )
  return (memecurrentprice[0][0]).to_i
end

#Method to return a meme previous price given a name
def meme_previousprice_return(name)
  memepreviousprice = $database.execute(
    'SELECT PreviousPrice FROM Meme WHERE Name = ?',
    [name]
  )
  return (memepreviousprice[0][0]).to_i
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
	puts "cats"
	puts name
	puts "dogs"
    money = $database.execute(
    'SELECT AccountMoney FROM Users WHERE UserName = ?',
	[name]
  )
  return (money[0][0]).to_i
end

#Method to update account money
def account_money_update(name,money)
   $database.execute(
    'UPDATE Users SET AccountMoney = ? WHERE UserName = ?',
	[money,name]
  )
end


#Methods to access meme shares

#Method to access number of a given meme share given username
def share_number(user,meme)
  stockNo = $database.execute(
    'SELECT Meme_NO FROM MemeShares WHERE UserName = ? AND Name = ?',
	[user,meme]
  )
  return (stockNo[0][0]).to_i
end

#Method to change share count of a given meme and username
def share_edit(user,meme,stock)
     $database.execute(
    'UPDATE MemeShares SET Meme_NO = ? WHERE UserName = ? AND Name = ?',
	[stock,user,meme]
  )
end


#Higher Level Methods

#Buy 1 meme
def meme_buy_sell(user,meme,stock) 
  if account_money(user) < (meme_currentprice_return(meme)*stock.to_i)
	return "error not enough money"
  elsif  share_number(user,meme) + stock.to_i < 0
	return "error not enough stock to sell"
  elsif stock.to_i == 0
    #we do nothing :D
  else
	#Updating stock
	share_edit(user,meme,(stock.to_i+share_number(user,meme)))
	#Updating cash
	account_money_update(user,(account_money(user)-(stock.to_i*meme_currentprice_return(meme))))
  end
end
	
	


#TESTING CODE
#cool = gets.chomp

#puts meme_idreturn(cool)