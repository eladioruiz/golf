class CreateRights < ActiveRecord::Migration
  def self.up
    create_table "rights", :force => true do |t|
      t.integer  "user_id"
      t.string   "controller"
      t.string   "action"
      t.boolean  "action_allowed"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :rights
  end
end
