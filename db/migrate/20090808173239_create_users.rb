class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.decimal :handicap
      t.string :login
      t.string :password
      t.string :email
      t.boolean :enabled, :default=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end

class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.reference :user
      t.reference :match
      t.reference :tee
    end
  end
end