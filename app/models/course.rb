class Course < ActiveRecord::Base
  has_many :matches
  has_many :holes
end
