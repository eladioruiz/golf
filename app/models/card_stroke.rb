# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/10/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class CardStroke < ActiveRecord::Base
  belongs_to :card  # Check it
  belongs_to :hole

  attr_accessor :points_stableford

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
  
  def points_stableford
    aps       = self.points_stableford_per_hole
    strk      = self.strokes
    hole_par  = self.hole.par
    strk_allowed = aps + hole_par
    
    points = 0

    if strk > strk_allowed + 1
      points = 0
    elsif strk == strk_allowed + 1
      points = 1
    elsif strk == strk_allowed
      points = 2
    elsif strk == strk_allowed - 1
      points = 3
    elsif strk == strk_allowed - 2
      points = 4
    elsif strk == strk_allowed - 3
      points = 5
    elsif strk == strk_allowed - 4
      points = 6
    else
      points = 6
    end if

    points
  end

  def points_stableford_per_hole
    aps = add_points_stableford
    hole_handicap = self.hole.handicap
    if hole_handicap <= last_hole_stableford
        aps = aps + 1
    end
    
    aps
  end

  def add_points_stableford
    p = self.card.player
    hand = p.handicap
    n_holes = self.card.match.holes

    hand.to_i / n_holes.to_i
  end

  def last_hole_stableford
    p = self.card.player
    hand = p.handicap
    n_holes = self.card.match.holes

    hand.to_i % n_holes.to_i
  end
end
