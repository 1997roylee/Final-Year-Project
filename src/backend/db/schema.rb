# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_200_523_065_930) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'assignments', force: :cascade do |t|
    t.string 'title', default: '', null: false
    t.string 'description', default: '', null: false
    t.datetime 'submit_at', null: false
    t.integer 'lecture_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['lecture_id'], name: 'index_assignments_on_lecture_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.integer 'parent_id'
    t.string 'category_name', limit: 50
    t.string 'category_tags', limit: 256, default: ''
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_name'], name: 'index_categories_on_cateogry_name', unique: true
    t.index ['parent_id'], name: 'index_categories_on_parent_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'course_id', null: false
    t.float 'rating', default: 0.0, null: false
    t.string 'comment', default: '', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'courses', force: :cascade do |t|
    t.boolean 'is_active', default: true, null: false
    t.boolean 'is_public', default: true
    t.string 'course_title', limit: 256, default: '', null: false
    t.string 'course_number', limit: 256, default: '', null: false
    t.string 'course_image_url', limit: 256, default: ''
    t.string 'course_level', limit: 30, null: false
    t.string 'course_language', limit: 30, null: false
    t.float 'course_price', default: 0.0, null: false
    t.string 'category_name', limit: 50, default: ''
    t.integer 'category_id'
    t.text 'course_description', default: '', null: false
    t.string 'course_gain', limit: 256, default: '', null: false
    t.integer 'rating_score', default: 0, null: false
    t.integer 'reviews_count', default: 0, null: false
    t.integer 'enrol_count', default: 0, null: false
    t.float 'course_duration', default: 0.0, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_id'], name: 'index_courses_on_category_id'
    t.index ['course_number'], name: 'index_courses_on_course_number', unique: true
    t.index ['is_active'], name: 'index_courses_on_is_active'
    t.index ['is_public'], name: 'index_courses_on_is_public'
  end

  create_table 'enrols', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'course_id', null: false
    t.string 'status', default: 'enroling', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['course_id'], name: 'index_enrols_on_course_id'
    t.index %w[user_id course_id], name: 'index_enrols_on_course_id_n_user_id', unique: true
    t.index ['user_id'], name: 'index_enrols_on_user_id'
  end

  create_table 'lectures', force: :cascade do |t|
    t.integer 'course_id', null: false
    t.integer 'lecture', default: 0, null: false
    t.string 'title', default: '', null: false
    t.string 'description', default: '', null: false
    t.float 'duration', default: 0.0, null: false
    t.datetime 'start_at', null: false
    t.datetime 'end_at', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['course_id'], name: 'index_lectures_on_course_id'
  end

  create_table 'notifications', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'target_id', null: false
    t.string 'message', default: '', null: false
    t.boolean 'is_read', default: false, null: false
    t.string 'link', default: '', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['target_id'], name: 'index_notifications_on_target_id'
    t.index ['user_id'], name: 'index_notifications_on_user_id'
  end

  create_table 'ratings', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'course_id', null: false
    t.float 'rating', null: false
    t.string 'comment', default: '', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['course_id'], name: 'index_ratings_on_course_id'
    t.index %w[user_id course_id], name: 'index_ratings_on_course_id_n_user_id', unique: true
    t.index ['user_id'], name: 'index_ratings_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', limit: 64, null: false
    t.string 'password', limit: 20
    t.string 'password_digest', limit: 64
    t.string 'auth_token', default: '', null: false
    t.string 'reset_token', default: '', null: false
    t.string 'student_name', limit: 50, null: false
    t.string 'student_number', limit: 50, default: '', null: false
    t.string 'teacher_number', limit: 50, default: '', null: false
    t.boolean 'is_mail_verified', default: false, null: false
    t.boolean 'is_instructor', default: false, null: false
    t.boolean 'is_student', default: false, null: false
    t.boolean 'is_professor', default: false, null: false
    t.datetime 'last_actived_at'
    t.integer 'stars_score', default: 0, null: false
    t.integer 'reviews_count', default: 0, null: false
    t.integer 'customer_count', default: 0, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['auth_token'], name: 'index_users_on_auth_token'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['is_instructor'], name: 'index_users_on_is_instructor'
    t.index ['is_mail_verified'], name: 'index_users_on_is_mail_verified'
    t.index ['is_professor'], name: 'index_users_on_is_professor'
    t.index ['is_student'], name: 'index_users_on_is_student'
    t.index ['last_actived_at'], name: 'index_users_on_last_actived_at'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
end
