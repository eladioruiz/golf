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
    aps = points_stableford_per_hole
    strk      = self.strokes
    hole_par  = self.hole.par

    if strk + aps > hole_par + 1
      ps = 0
    elsif strk + aps = hole_par + 1
      ps = 1
    elsif strk + aps = hole_par
      ps = 2
    elsif strk + aps = hole_par - 1
      ps = 3
    elsif strk + aps = hole_par - 2
      ps = 4
    elsif strk + aps = hole_par - 3
      ps = 5
    elsif strk + aps = hole_par - 4
      ps = 6
    end if

    return ps
  end

  def points_stableford_per_hole
    aps = add_points_stableford
    hole_handicap = self.hole.handicap
    if hole_handicap <= last_hole_stableford
        ++aps
    end
    
    return aps
  end

  def add_points_stableford
    p = self.card.player
    hand = p.handicap
    n_holes = self.card.match.holes

    return hand.to_i / n_holes.to_i
  end

  def last_hole_stableford
    p = self.card.player
    hand = p.handicap
    n_holes = self.card.match.holes

    return hand.to_i % n_holes.to_i
  end
end
