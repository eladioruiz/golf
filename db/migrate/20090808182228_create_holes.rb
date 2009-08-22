# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 22/08/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class CreateHoles < ActiveRecord::Migration
  def self.up
    create_table :holes do |t|
      t.references :course
      t.integer :number
      t.integer :par
      t.integer :handicap
      t.boolean :enabled, :default=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :holes
  end
end
