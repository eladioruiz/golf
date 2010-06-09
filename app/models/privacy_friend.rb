# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 08/06/2010 by Eladio Ruiz
# Status::        Pending
# Comments::

class PrivacyFriend < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'user1_id'
  belongs_to :user, :foreign_key => 'user2_id'

  named_scope :my_friends, lambda { |userID|
                                {
                                  :select =>      "privacy_friends.user2_id",
                                  :from   =>      "privacy_friends",
                                  :conditions =>  ["privacy_friends.user1_id=?",userID]
                                }
                           }

end
