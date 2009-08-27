class Hole < ActiveRecord::Base
  belongs_to :course  # Check it
  belongs_to :card  # ¿?
end
