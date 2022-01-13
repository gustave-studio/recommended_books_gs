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

ActiveRecord::Schema.define(version: 2022_01_13_060155) do

  create_table "business_books", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "isbn"
    t.string "asin"
    t.text "description"
    t.string "category"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "editorial_department_recommendations", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "isbn"
    t.string "category"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "asin"
    t.text "description"
  end

  create_table "it_engineer_books_awards", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "isbn"
    t.string "category"
    t.string "award"
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "asin"
    t.text "description"
  end

  create_table "monthly_rankings", charset: "utf8mb4", force: :cascade do |t|
    t.string "url"
    t.string "isbn"
    t.integer "count"
    t.integer "ranking"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "likes_count"
    t.string "asin"
  end

  create_table "recommended_books", charset: "utf8mb4", force: :cascade do |t|
    t.text "book_url"
    t.integer "total_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "article_url"
    t.string "title"
    t.integer "likes_count"
    t.string "article_id"
    t.string "isbn"
    t.datetime "article_created_at"
    t.string "user_id"
    t.string "asin"
  end

  create_table "six_months_rankings", charset: "utf8mb4", force: :cascade do |t|
    t.string "url"
    t.string "isbn"
    t.integer "count"
    t.integer "ranking"
    t.string "integer"
    t.integer "likes_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "asin"
  end

  create_table "three_months_rankings", charset: "utf8mb4", force: :cascade do |t|
    t.string "url"
    t.string "isbn"
    t.integer "count"
    t.integer "ranking"
    t.string "integer"
    t.integer "likes_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "asin"
  end

end
