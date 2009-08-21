class Player < ActiveRecord::Base
  belongs_to :match
  belongs_to :user
  has_one :card
  has_one :tee
end
