# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090822090239) do

  create_table "cards", :force => true do |t|
    t.integer  "player_id"
    t.integer  "strokes_hole1"
    t.integer  "strokes_hole2"
    t.integer  "strokes_hole3"
    t.integer  "strokes_hole4"
    t.integer  "strokes_hole5"
    t.integer  "strokes_hole6"
    t.integer  "strokes_hole7"
    t.integer  "strokes_hole8"
    t.integer  "strokes_hole9"
    t.integer  "strokes_hole10"
    t.integer  "strokes_hole11"
    t.integer  "strokes_hole12"
    t.integer  "strokes_hole13"
    t.integer  "strokes_hole14"
    t.integer  "strokes_hole15"
    t.integer  "strokes_hole16"
    t.integer  "strokes_hole17"
    t.integer  "strokes_hole18"
    t.boolean  "enabled",        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "handicap"
    t.integer  "length_white"
    t.integer  "length_blue"
    t.integer  "length_yellow"
    t.integer  "length_red"
    t.boolean  "enabled",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holes", :force => true do |t|
    t.integer  "course_id"
    t.integer  "number"
    t.integer  "par"
    t.integer  "handicap"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", :force => true do |t|
    t.integer  "course_id"
    t.datetime "date_hour_match"
    t.integer  "holes"
    t.boolean  "enabled",         :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.integer  "tee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tees", :force => true do |t|
    t.string   "barras"
    t.boolean  "enabled",    :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "handicap",   :limit => 10, :precision => 10, :scale => 0
    t.string   "login"
    t.string   "password"
    t.string   "email"
    t.boolean  "enabled",                                                 :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
