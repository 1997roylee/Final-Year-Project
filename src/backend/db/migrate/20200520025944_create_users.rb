# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string 'email', limit: 64, null: false
      t.string 'password', limit: 20
      t.string 'password_digest', limit: 64

      t.string 'auth_token', null: false, default: ''
      t.string 'reset_token', null: false, default: ''

      # t.string 'first_name', limit: 50, null: false, default: ''
      # t.string 'last_name', limit: 50, null: false, default: ''
      t.string 'student_name', limit: 50, null: false

      t.string 'student_number', limit: 50, null: false, default: ''
      t.string 'teacher_number', limit: 50, null: false, default: ''

      # t.boolean "is_phone_verified", default: false, null: false
      t.boolean 'is_mail_verified', default: false, null: false

      t.boolean 'is_instructor', default: false, null: false
      t.boolean 'is_student', default: false, null: false
      t.boolean 'is_professor', default: false, null: false
      # t.datetime "pin_sent_at"
      t.datetime 'last_actived_at'

      t.integer 'stars_score', default: 0, null: false
      t.integer 'reviews_count', default: 0, null: false
      t.integer 'customer_count', default: 0, null: false

      t.index ['email'], name: 'index_users_on_email', unique: true
      t.index ['auth_token'], name: 'index_users_on_auth_token'
      t.index ['last_actived_at'], name: 'index_users_on_last_actived_at'
      t.index ['is_mail_verified'], name: 'index_users_on_is_mail_verified'
      t.index ['is_instructor'], name: 'index_users_on_is_instructor'
      t.index ['is_student'], name: 'index_users_on_is_student'
      t.index ['is_professor'], name: 'index_users_on_is_professor'
      t.timestamps
    end
  end
end
