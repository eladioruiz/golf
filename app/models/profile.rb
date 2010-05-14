class Profile < ActiveRecord::Base
   belongs_to :user

  def is_Admin?
    isadmin
  end
end
