class AlterPrivacy < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.references :privacy_type, :default => 1
    end

    change_table :matches do |t|
      t.references :privacy_type, :default => 1
    end

  end

  def self.down
  end
end
