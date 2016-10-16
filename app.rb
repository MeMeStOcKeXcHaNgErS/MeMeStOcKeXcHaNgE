require_relative 'controllers/app_controller'

class MemeStockExchangeApp < AppController
  get '/auth/:provider/callback' do
    session[:user_name] = "CurryKing1001" #request.env['omniauth.auth']['info']['name']#
    session[:login_time] = Time.new
    session[:authenticated] = true
    puts "LOG IN SUCCESSFULL @ #{session[:login_time]}"
    redirect '../../'
  end

  get '/' do
    erb :index
  end
  
  get '/auth/failure' do
    erb :error_page
  end
  
  get '/logout' do
    session[:authenticated] = false
    erb :logout
  end
end

MemeStockExchangeApp.run! if __FILE__ == $0

__END__
