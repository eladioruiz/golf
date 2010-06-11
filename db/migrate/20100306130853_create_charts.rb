class CreateCharts < ActiveRecord::Migration
  def self.up
    create_table "charts", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :charts
  end
end
