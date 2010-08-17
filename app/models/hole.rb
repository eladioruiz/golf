# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/10/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class Hole < ActiveRecord::Base
  belongs_to :course  # Check it
  has_many :card_strokes, :dependent => :destroy  # Check it
  has_many :cards, :through => :card_strokes

  named_scope :find_like_by_number, lambda {|course,num|
                                    {
                                      :select     => "holes.id, holes.number as value, holes.number as label ",
                                      :conditions => ["course_id = ? and number like ?", course, num]
                                    }
                                  }

  named_scope :get_holes_by_course_id, lambda {|course|
                                    {
                                      :select     => "holes.id as id, holes.number as number",
                                      :conditions => ["course_id = ? ", course]
                                    }
                                  }
  
end
