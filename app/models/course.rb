# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/10/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class Course < ActiveRecord::Base
  has_many   :holes # Check it
  has_many   :matches # Check it
  has_many   :images, :foreign_key => 'course_id', :class_name => "CourseImage"
  belongs_to :course_type

  after_create :create_holes, :if => :new_record?

  attr_reader :url_google

  named_scope :find_like_by_name, lambda {|descr|
                                    {
                                      :select     => "courses.id, courses.name as value, courses.name as label ",
                                      :conditions => ["name like ?", descr]
                                    }
                                  }

  def url_google
    (self.nil? || self.location_latitude.blank?) ? "" : "http://maps.google.com/maps?saddr=&daddr=" + self.location_latitude + "," + self.location_longitude
  end

  def create_holes
    (1..n_holes).each do |i|
      h = Hole.new(:number => i, :course_id => self.id)
      h.save
    end
  end

  def main_image
    self.images.first
  end

end
