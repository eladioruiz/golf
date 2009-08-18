class CreateHolesTees < ActiveRecord::Migration
  def self.up
    create_table :holes_tees, :id=>false do |t|
      t.references :hole
      t.references :tee
      t.integer :length
      t.boolean :enabled, :default=>true
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :holes_tees
  end
end