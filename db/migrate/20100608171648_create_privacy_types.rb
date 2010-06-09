class CreatePrivacyTypes < ActiveRecord::Migration
  def self.up
    create_table :privacy_types do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :privacy_types
  end
end
