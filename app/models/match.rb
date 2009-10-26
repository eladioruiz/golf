# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/10/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class Match < ActiveRecord::Base
  belongs_to :course  # Check it
  has_many :players, :dependent => :destroy  # Pending check it
  has_many :users, :through => :players, :order => 'players.id'  # Check it

  accepts_nested_attributes_for :players, :users, :allow_destroy => :true #, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }  # Check it
  
  def available_users
    User.all - users
  end
  
  def available_users?
    ! available_users.empty?
  end

  cattr_reader :per_page
  @@per_page = 10

  def description
    self.course.name + ' - ' + self.date_hour_match.strftime('%d/%m/%Y - %H:%M') 
  end
end
