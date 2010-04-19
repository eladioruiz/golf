class AddColumnsToCourse < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.string    :short_description,  :limit => 250
      t.string    :long_description,   :limit => 1000
      t.string    :founded,            :limit => 100
      t.string    :designer,           :limit => 100
      t.references :course_type
      t.integer   :ability_recommended
      t.integer   :maintance
      t.integer   :relief
      t.integer   :wind
      t.integer   :water_in_play
      t.integer   :trees_in_play
    end
  end

  def self.down
  end
end
