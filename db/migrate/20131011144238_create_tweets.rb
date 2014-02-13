require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string "tweet"
      t.integer "congress_member_id"
      t.timestamps
    end
  end
end
