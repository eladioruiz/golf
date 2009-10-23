class CreateCardStrokes < ActiveRecord::Migration
  def self.up
     create_table :card_strokes do |t|
       t.references :card
       t.references :hole
       t.integer :strokes
       t.integer :putts
       
       t.timestamps
     end
  end

  def self.down
      drop_table :card_strokes
  end
end
