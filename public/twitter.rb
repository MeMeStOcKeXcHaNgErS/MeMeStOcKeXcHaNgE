require 'twitter'

config = {
    :consumer_key => 'ixEQki4ZaGViG3Q7n2GZ2xKB5',
    :consumer_secret =>  'ZSRKCO4nJnSQf0fxojUhkDIGduvdPFJodWzz39cIQEJYuQtDEe',
}
@client = Twitter::REST::Client.new(config)


def stockValue(memename)
  dtime = Date.today.to_s
  tweets = @client.search(memename, :until => dtime).take(1)
  very_important_id = (tweets.to_s)[21,18].to_i # gets the id of the comment that is closest to the date
  puts very_important_id
  wanted_tweets = @client.search(memename, :since_id => (very_important_id))
  puts wanted_tweets_as_computer_readable_mess = wanted_tweets.to_hash.to_s
  moneyV = wanted_tweets_as_computer_readable_mess.count(':user=')
  return moneyV
end

def updateStock
  hstock = stockValue('Harambe')
  pstock = stockValue('Pepe')
  dstock = stockValue('Dodge')
  xstock = stockValue('Xzhibit')
  wstock = stockValue('Pawn shop')
  #needs integration
end

puts stockValue('Harambe')

#tweethash = tweets.to_hash
#it's a hash dummy
#puts tweethash[:favorited]
#tweetarray = tweethash.to_a
#puts tweetarray
#puts tweetarray[0][0]
#tweethash.each { |key, value| puts(key.to_s + "\n\n\n" + value.to_s)}