class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.references :course
      t.datetime :date_hour_match
      t.integer :holes
      t.boolean :enabled, :default=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
