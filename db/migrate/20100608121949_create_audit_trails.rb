class CreateAuditTrails < ActiveRecord::Migration
  def self.up
    create_table "audit_trails", :force => true do |t|
      t.integer  "user_id"
      t.string   "controller"
      t.string   "action"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :audit_trails
  end
end
