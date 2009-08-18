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
