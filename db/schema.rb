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

ActiveRecord::Schema.define(version: 2021_01_03_024200) do

  create_table "authorities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bodyparts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "day_of_the_week"
    t.integer "time_zone"
    t.bigint "user_id"
    t.bigint "trainingmenu_id"
    t.index ["trainingmenu_id"], name: "index_schedules_on_trainingmenu_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "trainingcategories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trainingmenudetails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "trainingmenu_id"
    t.bigint "training_id"
    t.index ["training_id"], name: "index_trainingmenudetails_on_training_id"
    t.index ["trainingmenu_id"], name: "index_trainingmenudetails_on_trainingmenu_id"
  end

  create_table "trainingmenus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_trainingmenus_on_user_id"
  end

  create_table "trainings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "explanation"
    t.string "image"
    t.string "url"
    t.integer "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "strength"
    t.bigint "user_id"
    t.bigint "trainingcategory_id"
    t.bigint "bodypart_id"
    t.index ["bodypart_id"], name: "index_trainings_on_bodypart_id"
    t.index ["trainingcategory_id"], name: "index_trainings_on_trainingcategory_id"
    t.index ["user_id"], name: "index_trainings_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.bigint "authority_id"
    t.index ["authority_id"], name: "index_users_on_authority_id"
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "schedules", "trainingmenus"
  add_foreign_key "schedules", "users"
  add_foreign_key "trainingmenudetails", "trainingmenus"
  add_foreign_key "trainingmenudetails", "trainings"
  add_foreign_key "trainingmenus", "users"
  add_foreign_key "trainings", "bodyparts"
  add_foreign_key "trainings", "trainingcategories"
  add_foreign_key "trainings", "users"
  add_foreign_key "users", "authorities"
end
