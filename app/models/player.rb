class Player < ActiveRecord::Base
  belongs_to :match
  belongs_to :tee
  belongs_to :user
end
