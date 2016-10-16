require 'twitter'
require 'rufus-scheduler'


scheduler = Rufus::Scheduler.new


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
   hstock = stockValue('Harambe')/100
   pstock = stockValue('Pepe')/100
   dstock = stockValue('Doge')/100
   xstock = stockValue('Xzibit')/100
   wstock = stockValue('Spongebob')/100
   #now the prems
   meme_previousprice_change('Harambe',meme_currentprice_return('Harambe'))
   meme_previousprice_change('Pepe',meme_currentprice_return('Pepe'))
   meme_previousprice_change('Doge',meme_currentprice_return('Doge'))
   meme_previousprice_change('Xzibit',meme_currentprice_return('Xzibit'))
   meme_previousprice_change('Spongebob',meme_currentprice_return('Spongebob'))
   #Now update the real ones
   meme_price_change('Harambe',hstock)
   meme_price_change('Pepe',pstock)
   meme_price_change('Doge',dstock)
   meme_price_change('Xzibit',xstock)
   meme_price_change('Spongebob',wstock)
end


scheduler.every '60s' do 
  updateStock
end
#x = 0
#while x == 0 do 
#  Thread.sleep(60000)
#  updateStock
#end
  
