class Match < ActiveRecord::Base
  belongs_to :course
  has_many :players

  accepts_nested_attributes_for :players, :allow_destroy => :true 
end
