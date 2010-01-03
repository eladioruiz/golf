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

  named_scope :this_week,  :conditions => ["date_hour_match BETWEEN ? AND ?" ,
                                        Time.now.beginning_of_week,
                                        Time.now.end_of_week]

  named_scope :this_month, :conditions => ["date_hour_match BETWEEN ? AND ?" ,
                                        Time.now.beginning_of_month,
                                        Time.now.end_of_month]

  named_scope :last_month, :conditions => ["date_hour_match BETWEEN ? AND ?" ,
                                        Time.now.last_month.beginning_of_month,
                                        Time.now.last_month.end_of_month]

  named_scope :last_matches, :select => "matches.* ",
                              :order => "date_hour_match DESC "

  named_scope :best_matches, :select => "matches.* ",
                              :joins => "inner join cards on matches.id=cards.match_id",
                              :conditions => "",
                              :order => "strokes_total DESC "

  named_scope :my_matches,    :select =>      "matches.*, cards.strokes_total",
                              :joins =>       "inner join players on matches.id=players.match_id inner join users on players.user_id=users.id left join cards on cards.match_id=matches.id and cards.player_id=players.id",
                              :conditions =>  "users.id=1"


  #def best
  #  all(:limit => 10, :order => 'strokes_total DESC')
  #end

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
