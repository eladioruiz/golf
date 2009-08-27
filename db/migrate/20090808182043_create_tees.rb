# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 22/08/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class CreateTees < ActiveRecord::Migration
  def self.up
    create_table :tees do |t|
      t.string :barras
      t.boolean :enabled, :default=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :tees
  end
end
