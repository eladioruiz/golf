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