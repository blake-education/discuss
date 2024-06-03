# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2013_04_28_235128) do

  create_table "discuss_messages", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.integer "user_id", null: false
    t.string "user_type"
    t.string "ancestry"
    t.text "draft_recipient_ids"
    t.datetime "sent_at"
    t.datetime "received_at"
    t.datetime "read_at"
    t.datetime "trashed_at"
    t.datetime "deleted_at"
    t.boolean "editable", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_discuss_messages_on_ancestry"
    t.index ["user_type", "user_id"], name: "index_discuss_messages_on_user_type_and_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
