# frozen_string_literal: true

class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|
      t.integer :course_id, null: false

      t.integer :lecture, null: false, default: 0
      t.string :title, null: false, default: ''
      t.string :description, null: false, default: ''
      t.float :duration,  null: false, default: 0.0

      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.index ['course_id'], name: 'index_lectures_on_course_id'

      t.timestamps
    end
  end
end
