ActiveRecord::Schema.define(version: 2018_08_22_154343) do

  create_table "bucket_items", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "due_date"
    t.string "location"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "about"
    t.string "image"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
