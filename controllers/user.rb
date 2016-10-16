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
    erb :user
  end
end
