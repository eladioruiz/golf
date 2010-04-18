class CourseImages < ActiveRecord::Migration
  def self.up
    create_table :course_images do |t|
       t.references :course
       t.string :filename
       t.integer :principal
       t.timestamps
     end
  end

  def self.down
    drop_table :course_images
  end
end
