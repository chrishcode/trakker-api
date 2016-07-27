# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160727191754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.integer  "episode_id"
    t.string   "episode_url"
    t.string   "episode_name"
    t.string   "episode_season"
    t.string   "episode_number"
    t.string   "episode_airdate"
    t.string   "episode_airtime"
    t.string   "episode_airstamp"
    t.string   "episode_runtime"
    t.string   "episode_image"
    t.string   "episode_summary"
    t.integer  "show_id"
    t.string   "show_url"
    t.string   "show_name"
    t.string   "show_type"
    t.string   "show_language"
    t.string   "show_genres"
    t.string   "show_status"
    t.string   "show_runtime"
    t.string   "show_premiered"
    t.string   "show_rating"
    t.string   "show_network"
    t.integer  "show_tvrage"
    t.integer  "show_thetvdb"
    t.string   "show_imdb"
    t.string   "show_image"
    t.string   "show_summary"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
