# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 22/08/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.references :player
      t.integer :strokes_hole1
      t.integer :strokes_hole2
      t.integer :strokes_hole3
      t.integer :strokes_hole4
      t.integer :strokes_hole5
      t.integer :strokes_hole6
      t.integer :strokes_hole7
      t.integer :strokes_hole8
      t.integer :strokes_hole9
      t.integer :strokes_hole10
      t.integer :strokes_hole11
      t.integer :strokes_hole12
      t.integer :strokes_hole13
      t.integer :strokes_hole14
      t.integer :strokes_hole15
      t.integer :strokes_hole16
      t.integer :strokes_hole17
      t.integer :strokes_hole18
      t.boolean :enabled, :default=>true

      t.timestamps
    end
  end

  def self.down
      drop_table :cards
  end
end
