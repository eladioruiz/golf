class CreateCoursetypes < ActiveRecord::Migration
  def self.up
    create_table :coursetypes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :coursetypes
  end
end
