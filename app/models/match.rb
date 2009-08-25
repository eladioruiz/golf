class Match < ActiveRecord::Base
  belongs_to :course  # Check it
  has_many :players #, :dependent => destroy  # Pending check it  
  has_many :users, :through => :players  # Check it

  accepts_nested_attributes_for :players, :users, :allow_destroy => :true #, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }  # Check it
end
