class Card < ActiveRecord::Base
  belongs_to :player
  has_many :holes
end
