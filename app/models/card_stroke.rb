class CardStroke < ActiveRecord::Base
  belongs_to :card  # Check it
  belongs_to :hole
end
