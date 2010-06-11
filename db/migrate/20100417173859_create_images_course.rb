class CourseImages < ActiveRecord::Migration
  def self.up
    create_table "course_images", :force => true do |t|
      t.integer  "course_id"
      t.string   "filename"
      t.integer  "principal"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "title",      :limit => 50
    end
  end

  def self.down
    drop_table :course_images
  end
end
