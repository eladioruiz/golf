# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 24/08/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.references :player
      t.references :match
      t.integer :strokes_total
      t.integer :strokes_first_9
      t.integer :strokes_second_9

      t.timestamps
    end
  end

  def self.down
      drop_table :cards
  end
end
