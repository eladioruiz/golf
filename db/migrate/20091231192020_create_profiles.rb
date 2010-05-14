class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.reference :user
      t.string :description
      t.boolean :isadmin
      t.boolean :enabled

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
