class AddLocationCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :location_latitude, :string
    add_column :courses, :location_longitude, :string
  end

  def self.down
    drop_column :courses, :location_latitude
    drop_column :courses, :location_longitude
  end
end
