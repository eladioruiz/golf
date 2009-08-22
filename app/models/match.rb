class Match < ActiveRecord::Base
  belongs_to :course  # Check it
  has_many :users, :through => :players  # Check it

  accepts_nested_attributes_for :players, :allow_destroy => :true  # Check it
end
