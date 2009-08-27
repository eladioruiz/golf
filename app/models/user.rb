class User < ActiveRecord::Base
   has_many :player  # Check it
   has_many :matches  # Check it
end