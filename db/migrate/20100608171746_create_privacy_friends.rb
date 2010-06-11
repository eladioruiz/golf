class CreatePrivacyFriends < ActiveRecord::Migration
  def self.up
    create_table "privacy_friends", :force => true do |t|
      t.integer  "user1_id",   :null => false
      t.integer  "user2_id",   :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :privacy_friends
  end
end
