# frozen_string_literal: true

class CreateEnrols < ActiveRecord::Migration[6.0]
  def change
    create_table :enrols do |t|
      t.integer :user_id, null: false
      t.integer :course_id, null: false
      t.string :status, null: false, default: 'enroling'

      t.index ['user_id'], name: 'index_enrols_on_user_id'
      t.index ['course_id'], name: 'index_enrols_on_course_id'
      t.index %w[user_id course_id], name: 'index_enrols_on_course_id_n_user_id', unique: true
      t.timestamps
    end
  end
end
