class AltertableHole < ActiveRecord::Migration
  def self.up
    add_column :holes, :length_red, :integer
    add_column :holes, :length_yellow, :integer
    add_column :holes, :length_blue, :integer
    add_column :holes, :length_white, :integer
  end

  def self.down
    remove_column :holes, :length_red
    remove_column :holes, :length_yellow
    remove_column :holes, :length_blue
    remove_column :holes, :length_white
  end
end
