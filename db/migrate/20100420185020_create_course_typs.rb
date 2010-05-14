class CreateCourseTyps < ActiveRecord::Migration
  def self.up
    create_table :course_typs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :course_typs
  end
end
