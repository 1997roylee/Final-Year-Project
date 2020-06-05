# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id, null: false
      t.integer :course_id, null: false

      t.float :rating, null: false
      t.string :comment, null: false, default: ''

      t.index ['user_id'], name: 'index_ratings_on_user_id'
      t.index ['course_id'], name: 'index_ratings_on_course_id'
      t.index %w[user_id course_id], name: 'index_ratings_on_course_id_n_user_id', unique: true
      t.timestamps
    end
  end
end
