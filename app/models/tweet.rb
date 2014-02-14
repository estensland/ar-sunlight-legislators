require_relative '../../db/config'
require_relative 'congress_member'
require 'twitter'

class Tweet < ActiveRecord::Base
  belongs_to :congress_member
end




