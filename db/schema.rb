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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130224215447) do

  create_table "content_images", :force => true do |t|
    t.integer "page_id"
    t.string  "image"
    t.date    "created_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "members", :force => true do |t|
    t.string   "eligibility_clause"
    t.string   "eligibility_justification"
    t.string   "payment_method"
    t.string   "paypal_payer_id"
    t.string   "paypal_token"
    t.string   "given_name"
    t.string   "family_name"
    t.string   "postal_address"
    t.string   "phone_number_mobile"
    t.string   "phone_number_other"
    t.string   "email"
    t.date     "date_of_birth"
    t.string   "gender"
    t.boolean  "new_member",                         :default => true
    t.string   "your_existing_mubc_singlet_numbers"
    t.text     "how_did_you_hear_about_the_club"
    t.integer  "amount_paid"
    t.boolean  "payment_confirmed",                  :default => false
    t.string   "payment_acknowledgement"
    t.string   "photo"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.boolean  "photo_processing"
  end

  create_table "pages", :force => true do |t|
    t.string   "type"
    t.string   "title"
    t.string   "author"
    t.text     "synopsis"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "pdf"
    t.string   "slug"
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

end
