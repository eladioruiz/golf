class Match < ActiveRecord::Base
  belongs_to :course
  has_many :player
  has_many :cards
end
