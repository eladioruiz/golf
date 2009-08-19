class Match < ActiveRecord::Base
  belongs_to :course
  has_many :players
end
