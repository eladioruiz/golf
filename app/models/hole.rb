# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/10/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class Hole < ActiveRecord::Base
  belongs_to :course  # Check it
  has_many :card_strokes, :dependent => :destroy  # Check it
  has_many :cards, :through => :card_strokes
  
end
