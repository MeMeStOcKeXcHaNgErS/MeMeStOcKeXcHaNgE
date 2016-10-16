
class UserController < AppController
  get '/' do
    throw(:halt, [401, (erb :error_page)]) unless session[:authenticated]
    puts "VISITED USER PAGE"
    erb :user
  end
end
