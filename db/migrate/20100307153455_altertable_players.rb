class AltertablePlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :handicap, :integer
  end

  def self.down
    remove_column :players, :handicap
  end
end
