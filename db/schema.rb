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

ActiveRecord::Schema.define(version: 20221129233509) do

  create_table "applications", force: :cascade do |t|
    t.integer "student_id"
    t.integer "university_id"
    t.integer "department_id"
    t.string  "application_status"
    t.index ["department_id"], name: "index_applications_on_department_id"
    t.index ["student_id"], name: "index_applications_on_student_id"
    t.index ["university_id"], name: "index_applications_on_university_id"
  end

  create_table "departments", force: :cascade do |t|
    t.integer "university_id"
    t.integer "departments_id"
    t.string  "name"
    t.string  "description"
    t.index ["university_id"], name: "index_departments_on_university_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string  "student_email"
    t.integer "contacted_number"
    t.index ["student_email"], name: "index_emails_on_student_email"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "faculty_id"
    t.integer  "student_id"
    t.integer  "university_id"
    t.integer  "application_id"
    t.string   "comment"
    t.string   "applied_term"
    t.integer  "score"
    t.string   "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["application_id"], name: "index_evaluations_on_application_id"
    t.index ["faculty_id"], name: "index_evaluations_on_faculty_id"
    t.index ["student_id"], name: "index_evaluations_on_student_id"
    t.index ["university_id"], name: "index_evaluations_on_university_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.integer "student_id"
    t.string  "company_name"
    t.string  "description"
    t.string  "job_title"
    t.string  "from"
    t.string  "to"
    t.index ["student_id"], name: "index_experiences_on_student_id"
  end

  create_table "faculty_members", force: :cascade do |t|
    t.integer "department_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "password_digest"
    t.string  "department"
    t.boolean "chair"
    t.string  "university"
    t.string  "focus_area"
    t.string  "research_url"
    t.index ["department_id"], name: "index_faculty_members_on_department_id"
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
    t.index ["student_id"], name: "index_profiles_on_student_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_resumes_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universities", force: :cascade do |t|
    t.string  "name"
    t.string  "state"
    t.integer "rank"
  end

end
