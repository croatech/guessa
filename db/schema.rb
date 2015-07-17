ActiveRecord::Schema.define(version: 20150706030416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "score",      default: 0
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "year"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.text     "session_key"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "admin"
  end

end