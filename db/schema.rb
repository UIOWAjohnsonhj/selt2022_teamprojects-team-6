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

ActiveRecord::Schema.define(version: 20221108040054) do

  create_table "applications", force: :cascade do |t|
    t.string "student_id"
    t.string "university_id"
    t.string "department_id"
    t.string "application_status"
  end

  create_table "departments", force: :cascade do |t|
    t.integer "university_id"
    t.string  "name"
    t.string  "description"
  end

  create_table "experiences", force: :cascade do |t|
    t.integer "student_id"
    t.string  "company_name"
    t.string  "description"
    t.string  "job_title"
    t.string  "from"
    t.string  "to"
  end

  create_table "faculties", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "password_digest"
    t.string  "department"
    t.boolean "chair"
    t.string  "university"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "student_id"
    t.integer "gre"
    t.integer "toefl"
    t.integer "capa"
    t.string  "interested_major"
    t.string  "term"
    t.string  "year"
    t.string  "college_name"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "undergraduate_schools", force: :cascade do |t|
    t.string   "student_id"
    t.string   "country"
    t.string   "university_name"
    t.string   "major"
    t.float    "gpa"
    t.string   "grading_scale"
    t.integer  "start_year"
    t.integer  "expected_grad_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universities", force: :cascade do |t|
    t.string  "name"
    t.string  "state"
    t.integer "rank"
  end

end
