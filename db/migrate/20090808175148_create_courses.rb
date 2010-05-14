# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 22/08/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :name
      t.string :address
      t.integer :handicap
      t.integer :length_white
      t.integer :length_blue
      t.integer :length_yellow
      t.integer :length_red
      t.boolean :enabled, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
