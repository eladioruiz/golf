# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 22/08/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.references :player
      t.references :hole
      t.integer :strokes_hole
      t.boolean :enabled, :default=>true

      t.timestamps
    end
  end

  def self.down
      drop_table :cards
  end
end
