require_relative 'controllers/app_controller'

class MemeStockExchangeApp < AppController
  get '/auth/:provider/callback' do
    puts "LOG IN SUCCESSFULL!"
  end

  get '/' do
    erb :index
  end
end

MemeStockExchangeApp.run! if __FILE__ == $0

__END__
