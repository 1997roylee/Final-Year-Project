# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.boolean 'is_active', default: true, null: false
      t.boolean 'is_public', default: true, nil: false

      t.string 'course_title',  limit: 256, null: false, default: ''
      t.string 'course_number', limit: 256, null: false, default: ''
      t.string 'course_image_url', limit: 256, nill: false, default: ''

      t.string 'course_level', null: false, limit: 30
      t.string 'course_language', null: false, limit: 30
      t.float 'course_price', null: false, default: 0.0

      t.string 'category_name',  limit: 50, nill: false, default: ''
      t.integer 'category_id', nill: false

      t.text 'course_description', null: false, default: '', limit: 512
      t.string 'course_gain', null: false, default: '', limit: 256

      t.integer 'rating_score', default: 0, null: false
      t.integer 'reviews_count', default: 0, null: false
      t.integer 'enrol_count', default: 0, null: false
      t.float 'course_duration', null: false, default: 0

      t.index ['category_id'], name: 'index_courses_on_category_id'
      t.index ['is_active'], name: 'index_courses_on_is_active'
      t.index ['is_public'], name: 'index_courses_on_is_public'
      t.index ['course_number'], name: 'index_courses_on_course_number', unique: true
      t.timestamps
    end
  end
end
