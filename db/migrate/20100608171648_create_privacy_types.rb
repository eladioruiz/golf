class CreatePrivacyTypes < ActiveRecord::Migration
  def self.up
    create_table "privacy_types", :force => true do |t|
      t.string   "description"
      t.boolean  "enabled",     :default => true
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :privacy_types
  end
end
