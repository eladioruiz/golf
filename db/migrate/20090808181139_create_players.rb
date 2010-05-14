# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 22/08/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.references :user
      t.references :match
      t.references :tee
      
      t.timestamps
    end
  end
  
  def self.down
     drop_table :players
  end
end