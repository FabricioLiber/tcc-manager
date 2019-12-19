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

ActiveRecord::Schema.define(version: 2019_12_19_002951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "tipo"
    t.string "status"
    t.float "nota"
    t.bigint "student_id"
    t.bigint "document_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_requests_on_document_id"
    t.index ["student_id"], name: "index_requests_on_student_id"
    t.index ["teacher_id"], name: "index_requests_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "nome"
    t.string "matricula"
    t.boolean "apto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "nome"
    t.string "matricula"
    t.string "especialidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "requests", "documents"
  add_foreign_key "requests", "students"
  add_foreign_key "requests", "teachers"
end
