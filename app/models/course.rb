# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/10/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class Course < ActiveRecord::Base
  has_many :holes # Check it
  has_many :matches # Check it
  belongs_to :course_type

  after_save :create_holes, :if => :new_record?

  def create_holes
    (1..n_holes).each do |i|
      h = Hole.new(:number => i, :course_id => self.id)
      h.save
    end
  end

  cattr_reader :per_page
  @@per_page = 10

end
