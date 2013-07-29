class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets!
    timeline = Twitter.user_timeline(self.user_name)
    timeline.each do |tweet|
      Tweet.create(text: tweet[:text], tweet_creation_time: tweet[:created_at], twitter_user_id: self.id)
    end
  end

  def tweets_stale?
    self.tweets.empty? || self.tweets.order('created_at DESC').limit(1).first.created_at < 15.minutes.ago 
  end

end
