# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 08/06/2010 by Eladio Ruiz
# Status::        Pending
# Comments::

class Right < ActiveRecord::Base
  named_scope :my_rights,    lambda { |userID|
                                {
                                  :select =>      "rights.*",
                                  :conditions =>  ["rights.user_id=?",userID]
                                }
                              }

  def self.action_allowed?(user_id,audit_controller,audit_action)
    @res = false
    @rights = Right.my_rights(user_id).find_all_by_controller(audit_controller)
    @rights.each do |right|
      @res = @res || (right.action==audit_action)
    end

    return @res
  end

end
