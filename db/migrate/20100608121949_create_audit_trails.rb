class CreateAuditTrails < ActiveRecord::Migration
  def self.up
    create_table :audit_trails do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :audit_trails
  end
end
