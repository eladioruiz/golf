class Card < ActiveRecord::Base
  belongs_to :player  # Check it
  has_many :holes  # Check it
end
