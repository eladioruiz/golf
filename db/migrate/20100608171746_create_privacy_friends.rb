class CreatePrivacyFriends < ActiveRecord::Migration
  def self.up
    create_table :privacy_friends do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :privacy_friends
  end
end
