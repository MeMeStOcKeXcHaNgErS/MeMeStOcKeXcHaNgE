
class UserController < AppController
  get '/' do
    puts "VISITED USER PAGE"
	erb :user
  end
end
