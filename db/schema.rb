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

ActiveRecord::Schema.define(version: 2020_06_28_022644) do

  create_table "alimentos", force: :cascade do |t|
    t.string "nome"
    t.string "marca"
    t.float "energia"
    t.float "proteina"
    t.float "carb_total"
    t.float "carb_disp"
    t.float "fibra"
    t.float "acucar"
    t.float "gord_total"
    t.float "gord_sat"
    t.float "gord_mono"
    t.float "gord_poli"
    t.float "gord_trans"
    t.float "colesterol"
    t.float "sodio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_alimentos_on_user_id"
  end

  create_table "porcao_referencia", force: :cascade do |t|
    t.float "quantidade"
    t.string "unidade"
    t.integer "alimento_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["alimento_id"], name: "index_porcao_referencia_on_alimento_id"
  end

  create_table "refeicoes", force: :cascade do |t|
    t.string "nome"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "data"
    t.time "horario"
    t.index ["user_id"], name: "index_refeicoes_on_user_id"
  end

  create_table "registros", force: :cascade do |t|
    t.integer "alimento_id", null: false
    t.integer "refeicao_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "quantidade"
    t.string "unidade"
    t.index ["alimento_id"], name: "index_registros_on_alimento_id"
    t.index ["refeicao_id"], name: "index_registros_on_refeicao_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "confirmation_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alimentos", "users"
  add_foreign_key "porcao_referencia", "alimentos"
  add_foreign_key "refeicoes", "users"
  add_foreign_key "registros", "alimentos"
  add_foreign_key "registros", "refeicoes"
end
