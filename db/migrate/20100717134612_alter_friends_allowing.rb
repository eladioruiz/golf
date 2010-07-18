class AlterFriendsAllowing < ActiveRecord::Migration
  def self.up
    change_table :privacy_friends do |t|
      t.integer   :allowed, :default => 0
    end

  end

  def self.down
  end
end
