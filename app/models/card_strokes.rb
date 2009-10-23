class CardStrokes < ActiveRecord::Base
  belongs_to :card  # Check it
  has_one :hole
end
