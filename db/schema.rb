# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150313180711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disruptions", force: true do |t|
    t.integer  "uniq_id",         limit: 8
    t.string   "status"
    t.string   "severity"
    t.string   "levelOfInterest"
    t.string   "category"
    t.string   "subCategory"
    t.datetime "startTime"
    t.datetime "endTime"
    t.datetime "remarkTime"
    t.datetime "lastModTime"
    t.string   "location"
    t.string   "corridor"
    t.text     "comments"
    t.text     "currentUpdate"
    t.text     "CauseArea"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
