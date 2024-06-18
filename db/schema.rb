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

ActiveRecord::Schema[7.0].define(version: 2024_05_24_032026) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", 
unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "actividads", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "titulo"
    t.text "descripcion"
    t.integer "cantidad_personas"
    t.datetime "fecha"
    t.integer "valor"
    t.float "calificacion_promedio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "publica"
    t.index ["user_id"], name: "index_actividads_on_user_id"
  end

  create_table "mensajes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "actividad_id", null: false
    t.datetime "fecha"
    t.text "contenido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actividad_id"], name: "index_mensajes_on_actividad_id"
    t.index ["user_id"], name: "index_mensajes_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "resenas", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "actividad_id", null: false
    t.datetime "fecha"
    t.text "contenido"
    t.float "calificacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actividad_id"], name: "index_resenas_on_actividad_id"
    t.index ["user_id"], name: "index_resenas_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.boolean "is_private", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "actividad_id", null: false
    t.index ["actividad_id"], name: "index_rooms_on_actividad_id"
  end

  create_table "solicituds", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "actividad_id", null: false
    t.datetime "fecha"
    t.text "descripcion"
    t.boolean "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actividad_id"], name: "index_solicituds_on_actividad_id"
    t.index ["user_id"], name: "index_solicituds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "phone"
    t.string "descripcion"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "actividads", "users"
  add_foreign_key "mensajes", "actividads"
  add_foreign_key "mensajes", "users"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "resenas", "actividads"
  add_foreign_key "resenas", "users"
  add_foreign_key "rooms", "actividads"
  add_foreign_key "solicituds", "actividads"
  add_foreign_key "solicituds", "users"
end
