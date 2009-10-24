class Hole < ActiveRecord::Base
  belongs_to :course  # Check it
  has_many :card_strokes, :dependent => :destroy  # Check it
  has_many :cards, :through => :card_strokes
  
end
