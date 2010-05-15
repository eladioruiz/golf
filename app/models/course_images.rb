# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 17/04/2010 by Eladio Ruiz
# Status::        Testing
# Comments::

class CourseImage < ActiveRecord::Base
  belongs_to :course  # Check it

  named_scope :sort, 'ORDER BY principal, id'

  def is_principal?
    principal
  end
end