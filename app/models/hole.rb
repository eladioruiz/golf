class Hole < ActiveRecord::Base
  belongs_to :course
  belongs_to :card
end
