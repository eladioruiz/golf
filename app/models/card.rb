class Card < ActiveRecord::Base
  belongs_to :player  # Check it
  has_many :card_strokes, :dependent => :destroy  # Check it
end
