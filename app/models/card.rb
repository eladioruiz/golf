# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/10/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class Card < ActiveRecord::Base
  belongs_to :player  # Check it
  belongs_to :match  # Check it
  has_many :card_strokes, :dependent => :destroy, :order => 'card_strokes.hole_id' # Check it
  has_many :holes, :through => :card_strokes, :order => 'card_strokes.hole_id'

  accepts_nested_attributes_for :card_strokes, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  def add_strokes_per_hole(pHole,pStrokes,pPutts)
    cs = CardStroke.new
    cs.hole = Hole.find(pHole)
    cs.card = self
    cs.strokes = pStrokes
    cs.putts = pPutts
    cs.save
  end

  def recalculate_strokes()
    cs = self.card_strokes
    @strokes_first = 0
    @strokes_second = 0
    @strokes_total = 0
    cs.each do |hole_card|
      @strokes_first +=hole_card.strokes if hole_card.hole.number<=9
      @strokes_second +=hole_card.strokes if hole_card.hole.number>9
      @strokes_total +=hole_card.strokes
    end
    self.strokes_first_9 = @strokes_first
    self.strokes_second_9 = @strokes_second
    self.strokes_total = @strokes_total
    self.save
  end

end
