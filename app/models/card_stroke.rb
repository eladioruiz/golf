# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/10/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class CardStroke < ActiveRecord::Base
  belongs_to :card  # Check it
  belongs_to :hole

  named_scope :sort, 'ORDER BY hole_id'

  named_scope :find_by_hole_number, lambda {|hole_number|
                                          {
                                            :joins      => ' inner join holes on card_strokes.hole_id=holes.id',
                                            :conditions => [' holes.number=?', hole_number]
                                          }
                                        }

  def hole_number
    h = Hole.find_by_id(hole_id)
    h.number
  end
end
