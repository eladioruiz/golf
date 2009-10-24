# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/10/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

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
