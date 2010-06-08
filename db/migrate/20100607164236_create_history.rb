# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 07/06/2010 by Eladio Ruiz
# Status::        Pending
# Comments::

class CreateHistory < ActiveRecord::Migration
  def self.up
    create_table :history do |t|
      t.references :user
      t.string :controller
      t.string :action

      t.timestamps
    end
  end

  def self.down
      drop_table :history
  end
end
