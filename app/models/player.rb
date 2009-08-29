class Player < ActiveRecord::Base
  belongs_to :match  # Check it
  belongs_to :user  # Check it
  belongs_to :tee  # Check it
  has_one :card  # Check it

  after_destroy :log_destroy_action

  def log_destroy_action
    puts 'Post destroyed'
  end
end
