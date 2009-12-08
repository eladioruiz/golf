class AddNholesToCourses < ActiveRecord::Migration
  def self.up
      add_column :courses, :n_holes, :integer, :default => 18
  end

  def self.down
    remove_column :courses, :n_holes
  end
end
