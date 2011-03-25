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
    num = 0

    h = Hole.find_by_id(hole_id)
    num = h.number unless h.nil?

    num
  end
  
  def points_stableford
    aps           = 0
    strk          = 0
    hole_par      = 0
    strk_allowed  = 0
    points        = 0

    aps           = self.points_stableford_per_hole
    strk          = self.strokes
    hole_par      = self.hole.par unless self.hole.nil?
    strk_allowed  = aps + hole_par
    
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
      points = 0
    end if

    points
  end

  def points_stableford_per_hole
    aps = 0
    aps = add_points_stableford
    hole_handicap = self.hole.handicap unless self.hole.nil?
    if hole_handicap <= last_hole_stableford
        aps = aps + 1
    end
    
    aps
  end

  def add_points_stableford
    p = 0
    hand = 0
    n_holes = 0

    p = self.card.player unless self.card.player.nil?
    hand = p.handicap unless p.handicap.nil?
    n_holes = self.card.match.holes unless card.match.holes.nil?

    if n_holes.to_i!=0
      hand.to_i / n_holes.to_i
    else
      0
    end
  end

  def last_hole_stableford
    p = 0
    hand = 0
    n_holes = 0

    p = self.card.player unless self.card.nil?
    hand = p.handicap unless p.nil?
    n_holes = self.card.match.holes unless card.match.nil?

    hand.to_i % n_holes.to_i
  end
end
