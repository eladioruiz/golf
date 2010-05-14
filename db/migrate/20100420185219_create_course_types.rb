class CreateCourseTypes < ActiveRecord::Migration
  def self.up
    create_table :course_types do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :course_types
  end
end
