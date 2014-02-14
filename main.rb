require_relative 'db/config'
require_relative 'app/models/congress_member'
require_relative 'app/models/tweet'

require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
end


legislator = CongressMember.all

array = []

legislator.each do |legislator|
  unless legislator.twitter_id == ""
    client.search("#{legislator.twitter_id}", :result_type => "recent").take(10).each do |tweet|
      opt = {tweet: tweet.text, congress_member_id: "#{legislator.id}"}

      Tweet.create(opt)
    end
  end
end

p Tweet.all
