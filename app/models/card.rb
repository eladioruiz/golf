# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/10/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class Card < ActiveRecord::Base
  belongs_to :player  # Check it
  has_many :card_strokes, :dependent => :destroy  # Check it
  has_many :holes, :through => :card_strokes, :order => 'card_stroke.id'
  has_many :dummies
  
  accepts_nested_attributes_for :card_strokes, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
