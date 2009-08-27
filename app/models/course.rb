class Course < ActiveRecord::Base
  has_many :holes # Check it
  has_many :matches # Check it
end
