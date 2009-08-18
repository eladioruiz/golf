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

class CreateHolesTees < ActiveRecord::Migration
  def self.up
    create table :holes_tees, :id => false do |t|
      t.references :hole
      t.references :tee
      t.integer :length
      t.boolean :enabled, :default=>true
    end
  end
  
  def self.down
    drop_table :holes_tees
  end
end