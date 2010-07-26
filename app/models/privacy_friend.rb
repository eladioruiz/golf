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
                                  :select =>      "* ",
                                  :from   =>      "privacy_friends",
                                  :conditions =>  ["allowed=1 and privacy_friends.user1_id=?",userID]
                                }
                           }

  named_scope :my_friends_all, lambda { |userID|
                                {
                                  :select =>      "* ",
                                  :from   =>      "privacy_friends",
                                  :conditions =>  ["privacy_friends.user1_id=?",userID]
                                }
                           }

  named_scope :my_friends_pending, lambda { |userID|
                                {
                                  :select =>      "* ",
                                  :from   =>      "privacy_friends",
                                  :conditions =>  ["allowed=0 and privacy_friends.user1_id=?",userID]
                                }
                           }

  named_scope :pending_of_any_friends, lambda { |userID|
                                {
                                  :select =>      "* ",
                                  :from   =>      "privacy_friends",
                                  :conditions =>  ["allowed=0 and privacy_friends.user2_id=?",userID]
                                }
                           }

  named_scope :friend_of_someone, lambda { |userID|
                                {
                                  :select =>      "* ",
                                  :from   =>      "privacy_friends",
                                  :conditions =>  ["privacy_friends.user2_id=?",userID]
                                }
                           }

end
