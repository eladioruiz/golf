class CreateCourseType < ActiveRecord::Migration
  def self.up
    create_table :course_types do |t|
      t.string :description, :limit => 50
      t.timestamp
    end
  end

  def self.down
    drop_table :course_types
  end
end
