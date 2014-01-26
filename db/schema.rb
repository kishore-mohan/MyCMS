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

ActiveRecord::Schema.define(version: 20130806173123213349) do

  create_table "addresses", force: true do |t|
    t.string   "address"
    t.string   "address_type"
    t.string   "address_code"
    t.integer  "user_id"
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "city"
    t.string   "postal_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id", using: :btree
  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "affiliations", force: true do |t|
    t.integer  "resume_id"
    t.string   "affiliations"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "api_users", force: true do |t|
    t.string   "api_key",     null: false
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "disabled_at"
  end

  create_table "ats", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "awards", force: true do |t|
    t.integer  "resume_id"
    t.string   "award"
    t.date     "year"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "awards", ["resume_id"], name: "index_awards_on_resume_id", using: :btree

  create_table "bullhorn_user_profiles", force: true do |t|
    t.string   "resume_email"
    t.integer  "candidate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "user_name"
  end

  create_table "certifications", force: true do |t|
    t.integer  "resume_id"
    t.string   "certification"
    t.date     "year"
    t.text     "notes"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "certifications", ["resume_id"], name: "index_certifications_on_resume_id", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "phone_no"
    t.string   "phone_type"
    t.string   "phone_code"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "country_icims"
    t.string   "country_code"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "customer_fields", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.integer  "Customer_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customer_fields", ["Customer_type_id"], name: "index_customer_fields_on_Customer_type_id", using: :btree

  create_table "customer_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "role_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "customer_users", ["email"], name: "index_customer_users_on_email", unique: true, using: :btree
  add_index "customer_users", ["reset_password_token"], name: "index_customer_users_on_reset_password_token", unique: true, using: :btree

  create_table "customers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diversities", force: true do |t|
    t.boolean  "hispanic_latino"
    t.string   "race"
    t.integer  "resume_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "educations", force: true do |t|
    t.integer  "resume_id"
    t.string   "degree_type"
    t.string   "degree_name"
    t.string   "school_name"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_graduated", default: true
    t.string   "activities"
    t.string   "notes"
    t.string   "major"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "educations", ["resume_id"], name: "index_educations_on_resume_id", using: :btree

  create_table "icims_user_profiles", force: true do |t|
    t.string   "resume_email"
    t.string   "profile_id",   limit: 45, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "icims_user_profiles", ["resume_email"], name: "index_ats_user_profiles_on_resume_email", using: :btree

  create_table "languages", force: true do |t|
    t.integer  "resume_id"
    t.string   "language"
    t.boolean  "is_write"
    t.boolean  "is_talk"
    t.boolean  "is_speak"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mobile_apply_customer_layouts", force: true do |t|
    t.integer  "mobile_apply_customer_id"
    t.string   "theme_color"
    t.string   "logo_path"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "mobile_apply_customer_test_jobs", force: true do |t|
    t.integer  "mobile_apply_customer_id"
    t.string   "job_id",                   null: false
    t.string   "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "mobile_apply_customer_test_jobs", ["mobile_apply_customer_id"], name: "index_mac_test_jobs_mac", using: :btree

  create_table "mobile_apply_customers", force: true do |t|
    t.string   "customer_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "ats_client_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "ats_jquery_id"
    t.integer  "ats_id"
    t.integer  "customer_user_id"
    t.string   "user_name"
    t.string   "password_digest"
    t.string   "client_id"
    t.string   "client_secret"
    t.string   "refresh_token"
    t.string   "auth_token"
    t.string   "company_code"
    t.string   "subdomain"
    t.string   "scraper_name"
    t.string   "soap_base_url"
  end

  create_table "mobile_apply_customers_resume_providers", force: true do |t|
    t.integer "mobile_apply_customer_id"
    t.integer "resume_provider_id"
  end

  create_table "movie_details", force: true do |t|
    t.integer  "movie_id"
    t.integer  "site_id"
    t.string   "rating"
    t.text     "review"
    t.string   "posted_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "plot"
    t.string   "verdict"
    t.string   "movie_site_url"
    t.string   "image"
  end

  add_index "movie_details", ["movie_id"], name: "index_movie_details_on_movie_id", using: :btree
  add_index "movie_details", ["rating"], name: "index_movie_details_on_rating", using: :btree
  add_index "movie_details", ["site_id"], name: "index_movie_details_on_site_id", using: :btree

  create_table "movies", force: true do |t|
    t.string   "title"
    t.integer  "rating",           default: 100
    t.string   "mpaa_rating"
    t.text     "plot"
    t.integer  "year"
    t.string   "poster"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "image"
    t.string   "direction"
    t.string   "screenplay"
    t.string   "background_score"
    t.string   "cinematography"
    t.string   "dialogues"
    t.string   "editing"
    t.string   "stunt"
    t.string   "dance"
    t.string   "singers"
    t.string   "lyrics"
    t.string   "production"
    t.integer  "visitor_id"
    t.datetime "release_date"
    t.string   "run_time"
  end

  create_table "permissions", force: true do |t|
    t.string   "subject_class"
    t.string   "action"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "permissions_roles", force: true do |t|
    t.integer "permission_id"
    t.integer "role_id"
  end

  create_table "positions", force: true do |t|
    t.string   "job_title"
    t.integer  "resume_id"
    t.string   "position_title"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_current"
    t.string   "company"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "positions", ["resume_id"], name: "index_positions_on_resume_id", using: :btree

  create_table "product_fields", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required"
    t.integer  "product_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "product_fields", ["product_type_id"], name: "index_product_fields_on_product_type_id", using: :btree

  create_table "product_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "product_type_id"
    t.text     "properties"
  end

  create_table "references", force: true do |t|
    t.integer  "resume_id"
    t.string   "reference"
    t.string   "source_name"
    t.string   "source_phone"
    t.string   "source_email"
    t.date     "year"
    t.text     "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "resume_providers", force: true do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "display_order"
  end

  create_table "resumes", force: true do |t|
    t.string   "title"
    t.string   "email"
    t.string   "recent_pay_amount"
    t.string   "recent_pay_type"
    t.string   "current_employed"
    t.text     "resume_text"
    t.string   "total_years_experience"
    t.text     "summary"
    t.text     "job_objective"
    t.boolean  "security_clearance"
    t.string   "resume_path"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "external_user_id"
  end

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: true do |t|
    t.string   "site_name"
    t.string   "url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "link_xpath"
    t.string   "name_xpath"
    t.string   "rating_xpath"
    t.string   "image_xpath"
    t.string   "review_xpath"
    t.string   "cast_crew_xpath"
  end

  add_index "sites", ["cast_crew_xpath"], name: "index_sites_on_cast_crew_xpath", using: :btree
  add_index "sites", ["image_xpath"], name: "index_sites_on_image_xpath", using: :btree
  add_index "sites", ["link_xpath"], name: "index_sites_on_link_xpath", using: :btree
  add_index "sites", ["name_xpath"], name: "index_sites_on_name_xpath", using: :btree
  add_index "sites", ["rating_xpath"], name: "index_sites_on_rating_xpath", using: :btree
  add_index "sites", ["review_xpath"], name: "index_sites_on_review_xpath", using: :btree
  add_index "sites", ["site_name"], name: "index_sites_on_site_name", using: :btree
  add_index "sites", ["url"], name: "index_sites_on_url", using: :btree

  create_table "skills", force: true do |t|
    t.integer  "resume_id"
    t.string   "skill"
    t.string   "total_months"
    t.date     "last_used"
    t.string   "skill_level"
    t.text     "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "skills", ["resume_id"], name: "index_skills_on_resume_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "state_icims"
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "state_code"
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "taleo_user_profiles", force: true do |t|
    t.string   "resume_email"
    t.string   "candidate_id", limit: 45, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "track_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "mobile_apply_customer_id"
    t.string   "job_id"
    t.string   "job_submission_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "encrypted_properties"
  end

  create_table "uniform_questionnaires", force: true do |t|
    t.integer  "user_id",                         null: false
    t.integer  "mobile_apply_customer_id",        null: false
    t.string   "job_id",                          null: false
    t.text     "encrypted_questions_and_replies"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "uniform_questionnaires", ["job_id"], name: "index_uniform_questionnaires_on_job_id", using: :btree
  add_index "uniform_questionnaires", ["mobile_apply_customer_id"], name: "index_uniform_questionnaires_on_mobile_apply_customer_id", using: :btree
  add_index "uniform_questionnaires", ["user_id", "mobile_apply_customer_id", "job_id"], name: "uniform_q_natural_key", using: :btree
  add_index "uniform_questionnaires", ["user_id"], name: "index_uniform_questionnaires_on_user_id", using: :btree

  create_table "user_system_profiles", force: true do |t|
    t.integer  "user_id"
    t.text     "encrypted_properties"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "mobile_apply_customer_id", null: false
  end

  add_index "user_system_profiles", ["user_id"], name: "index_user_system_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.string   "industry"
    t.string   "user_description"
    t.string   "location"
    t.string   "gender"
    t.string   "current_employer"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.text     "body"
    t.text     "body_html"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  create_table "visitors", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.integer  "age"
    t.string   "nationality"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "language"
    t.string   "uid"
    t.string   "provider"
    t.integer  "role_id"
  end

  add_index "visitors", ["authentication_token"], name: "index_visitors_on_authentication_token", unique: true, using: :btree
  add_index "visitors", ["email"], name: "index_visitors_on_email", using: :btree
  add_index "visitors", ["reset_password_token"], name: "index_visitors_on_reset_password_token", unique: true, using: :btree

end
