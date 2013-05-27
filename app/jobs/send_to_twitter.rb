require 'twitter'

class SendToTwitter
  @queue = :my_twitter_queue
  def self.perform(tweet_id)
    tweet = Tweet.find(tweet_id)
    puts "attempting to send tweet #{tweet_id} at #{Time.now}"
    Twitter.update(tweet.body)
  end
end
