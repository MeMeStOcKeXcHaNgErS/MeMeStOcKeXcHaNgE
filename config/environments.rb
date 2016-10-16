#The environment variable DATABASE_URL should be in the following format:
## => postgres://{user}:{password}@{host}:{port}/path
configure :production, :development do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://zwdtgshltlsaau:VEXbopALY1VWIlHOdCEUXzajU3@ec2-54-247-119-6.eu-west-1.compute.amazonaws.com:5432/d1vs17k9r02m9k')
  
  ActiveRecord::Base.establish_connection(
      :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host     => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
  )
end
