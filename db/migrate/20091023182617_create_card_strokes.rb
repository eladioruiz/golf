class CreateCardStrokes < ActiveRecord::Migration
  def self.up
     create_table :card_strokes do |t|
       t.references :match
       t.references :player
       t.integer :strokes_total
       t.integer :strokes_first_9
       t.integer :strokes_second_9
       
       t.timestamps
     end
  end

  def self.down
      drop_table :card_strokes
  end
end
