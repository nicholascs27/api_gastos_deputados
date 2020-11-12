# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_11_231829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "congresspeople", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "uf"
    t.string "political_party"
    t.integer "id_external"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spents", force: :cascade do |t|
    t.integer "congressperson_id"
    t.string "description"
    t.string "provider"
    t.decimal "value", precision: 10, scale: 2
    t.integer "month"
    t.date "issuance_date"
    t.string "document_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "yearly_spends", force: :cascade do |t|
    t.integer "congressperson_id"
    t.string "year"
    t.decimal "total", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
