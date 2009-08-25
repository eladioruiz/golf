# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 22/08/2009 by Eladio Ruiz
# Status::        Checked
# Comments::

class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.decimal :handicap
      t.string :login
      t.string :password
      t.string :email
      t.boolean :enabled, :default=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
