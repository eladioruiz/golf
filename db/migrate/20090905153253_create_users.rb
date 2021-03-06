class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :name,                      :string
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      t.column :handicap,                  :decimal
      t.column :enabled,                   :boolean, :default => true
      
      t.timestamps
    end
  end

  def self.down
    drop_table "users"
  end
end
