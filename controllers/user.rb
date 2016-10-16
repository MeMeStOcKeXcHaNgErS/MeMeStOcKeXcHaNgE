require './helpers/DBMethods'

class UserController < AppController
  get '/' do
    throw(:halt, [401, (erb :error_page)]) unless session[:authenticated]
    puts "VISITED USER PAGE"
	user_portfolio_name="CurryKing1001"
	@your_coins=account_money(user_portfolio_name)
	@b_stock=share_number(user_portfolio_name, "Spongebob")
	@d_stock=share_number(user_portfolio_name, "Doge")
	@h_stock=share_number(user_portfolio_name, "Harambe")
	@p_stock=share_number(user_portfolio_name, "Pepe")
	@x_stock=share_number(user_portfolio_name, "Xzibit")
	@networth = meme_currentprice_return('Harambe')*share_number("CurryKing1001",'Harambe')+meme_currentprice_return('Doge')*share_number("CurryKing1001",'Doge')+
	  meme_currentprice_return('Spongebob')*share_number("CurryKing1001",'Spongebob')+meme_currentprice_return('Xzibit')*share_number("CurryKing1001",'Xzibit')+meme_currentprice_return('Pepe')*share_number("CurryKing1001",'Pepe')
    erb :user
  end
end
