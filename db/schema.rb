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

ActiveRecord::Schema.define(version: 20140921080827) do

  create_table "articles", primary_key: "aid", force: true do |t|
    t.string   "title",          limit: 200,        null: false
    t.text     "description",                       null: false
    t.text     "content",        limit: 2147483647, null: false
    t.text     "relatedproduct"
    t.text     "relatedarticle"
    t.integer  "editor"
    t.integer  "browse"
    t.string   "keywords",                          null: false
    t.text     "shortcontent",                      null: false
    t.integer  "sblock",         limit: 1
    t.integer  "verify",         limit: 1
    t.integer  "sort"
    t.string   "searchkey",      limit: 100
    t.string   "img"
    t.string   "thumb"
    t.string   "seotitle",       limit: 200
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "product_id"
  end

  create_table "articles_products", id: false, force: true do |t|
    t.integer  "article_id", null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: true do |t|
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "title",       limit: 100,             null: false
    t.string   "keywords"
    t.string   "description"
    t.text     "content"
    t.string   "img",         limit: 200
    t.string   "thumb",       limit: 200
    t.integer  "sblock",      limit: 1,   default: 0, null: false
    t.integer  "sort",                    default: 0
    t.integer  "indexsort",               default: 0, null: false
    t.string   "seotitle",    limit: 200
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "routename"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "downloads", id: false, force: true do |t|
    t.integer  "did",                                null: false
    t.string   "title",           limit: 200,        null: false
    t.text     "description",                        null: false
    t.text     "content",         limit: 2147483647, null: false
    t.text     "relatedproduct",                     null: false
    t.text     "relateddownload",                    null: false
    t.integer  "editor",                             null: false
    t.integer  "browse",                             null: false
    t.string   "keywords",                           null: false
    t.text     "shortcontent",                       null: false
    t.integer  "sblock",          limit: 1,          null: false
    t.integer  "verify",          limit: 1,          null: false
    t.integer  "sort",                               null: false
    t.string   "searchkey",       limit: 100,        null: false
    t.string   "img",                                null: false
    t.string   "thumb",                              null: false
    t.string   "seotitle",        limit: 200,        null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "faqs", primary_key: "fid", force: true do |t|
    t.string   "title",          limit: 200,        null: false
    t.text     "description",                       null: false
    t.text     "content",        limit: 2147483647, null: false
    t.text     "relatedproduct",                    null: false
    t.text     "relatedarticle",                    null: false
    t.string   "editor",         limit: 50,         null: false
    t.integer  "browse",                            null: false
    t.string   "keywords",       limit: 250,        null: false
    t.text     "shortcontent",                      null: false
    t.string   "img",                               null: false
    t.string   "thumb",                             null: false
    t.integer  "sblock",         limit: 1,          null: false
    t.integer  "sort",                              null: false
    t.string   "searchkey",      limit: 200,        null: false
    t.integer  "verify",         limit: 1,          null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "faqs_products", id: false, force: true do |t|
    t.integer  "faq_id",     null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guestbook", primary_key: "gid", force: true do |t|
    t.string   "title",              limit: 100,             null: false
    t.string   "content",            limit: 100,             null: false
    t.string   "cname",              limit: 100,             null: false
    t.string   "caddress",           limit: 100,             null: false
    t.integer  "zipcode",                                    null: false
    t.string   "contacts",           limit: 100,             null: false
    t.string   "phone",              limit: 100,             null: false
    t.string   "email",              limit: 100,             null: false
    t.string   "guestip",            limit: 200,             null: false
    t.string   "guestarea",          limit: 200,             null: false
    t.integer  "replay_user_id",                             null: false
    t.text     "replay_content",                             null: false
    t.integer  "replay_update_time",                         null: false
    t.integer  "sblock",             limit: 1,   default: 1, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "links", primary_key: "lid", force: true do |t|
    t.integer  "sort",                    null: false
    t.string   "title",       limit: 200, null: false
    t.string   "img",                     null: false
    t.integer  "sblock",      limit: 1,   null: false
    t.string   "href",                    null: false
    t.string   "description", limit: 200, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "operation_log", primary_key: "operation_log", force: true do |t|
    t.integer "operation_uid",  limit: 3,        default: 0,  null: false
    t.string  "operation_node", limit: 50,       default: "", null: false
    t.text    "operation_ip",   limit: 16777215,              null: false
    t.integer "operation_time",                  default: 0,  null: false
  end

  add_index "operation_log", ["operation_uid", "operation_node", "operation_log"], name: "index_uid_node", using: :btree

  create_table "photos", force: true do |t|
    t.integer  "product_id",                         null: false
    t.integer  "sort",                   default: 0, null: false
    t.string   "image",      limit: 200,             null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "products", force: true do |t|
    t.integer  "article_id",                             null: false
    t.string   "title",          limit: 200,             null: false
    t.string   "seotitle",       limit: 200,             null: false
    t.integer  "category_id",                            null: false
    t.string   "keywords",       limit: 200,             null: false
    t.string   "description",    limit: 200,             null: false
    t.string   "img",            limit: 200
    t.string   "img2"
    t.string   "img3",           limit: 200
    t.text     "shortcontent",                           null: false
    t.text     "content",                                null: false
    t.text     "relatedproduct",                         null: false
    t.text     "relatedfaq",                             null: false
    t.integer  "sblock",         limit: 1,               null: false
    t.integer  "sort",                       default: 0, null: false
    t.integer  "homepage",       limit: 1,               null: false
    t.string   "searchkey",      limit: 200,             null: false
    t.integer  "verify",         limit: 1,               null: false
    t.integer  "browse",                                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "robot", primary_key: "rid", force: true do |t|
    t.string  "robotsname",  limit: 200, null: false
    t.text    "robotspage",              null: false
    t.text    "oldurl",                  null: false
    t.text    "robotsip",                null: false
    t.string  "robotsarea",              null: false
    t.integer "create_time",             null: false
  end

  create_table "singlepages", primary_key: "sid", force: true do |t|
    t.string   "title",          limit: 200,        null: false
    t.text     "description",                       null: false
    t.text     "content",        limit: 2147483647, null: false
    t.text     "relatedproduct",                    null: false
    t.text     "relatednews",                       null: false
    t.string   "editor",         limit: 50,         null: false
    t.integer  "browse",                            null: false
    t.string   "keywords",       limit: 200,        null: false
    t.text     "shortcontent",                      null: false
    t.integer  "sblock",         limit: 1,          null: false
    t.integer  "sort",                              null: false
    t.integer  "verify",         limit: 1,          null: false
    t.string   "seotitle",       limit: 200,        null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "routename",      limit: 250,        null: false
  end

  create_table "siteconfig", primary_key: "sid", force: true do |t|
    t.string  "companyname",           limit: 200, null: false
    t.string  "title",                 limit: 200, null: false
    t.string  "keywords",              limit: 200, null: false
    t.string  "description",                       null: false
    t.text    "address",                           null: false
    t.integer "sblock",                limit: 1,   null: false
    t.string  "img",                               null: false
    t.string  "article_title",         limit: 200, null: false
    t.string  "article_keywords",      limit: 200, null: false
    t.string  "article_description",   limit: 200, null: false
    t.string  "product_title",                     null: false
    t.string  "product_keywords",                  null: false
    t.string  "product_description",               null: false
    t.string  "faq_title",                         null: false
    t.string  "faq_keywords",                      null: false
    t.string  "faq_description",                   null: false
    t.string  "guestbook_title",       limit: 200, null: false
    t.string  "guestbook_keywords",    limit: 200, null: false
    t.string  "guestbook_description",             null: false
    t.integer "update_time",                       null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_j_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_j_users_on_reset_password_token", unique: true, using: :btree

end
