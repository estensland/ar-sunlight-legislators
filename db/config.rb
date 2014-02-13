require 'active_record'
require 'twitter'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-sunlight-legislators.sqlite3")


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "stens688"
  config.consumer_secret     = ""
  config.access_token        = "zZQd8E4OWnX0cTBNQr44KA"
  config.access_token_secret = ""
end
