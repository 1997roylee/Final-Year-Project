# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :course_id, null: false
      t.float :rating, null: false, default: 0
      t.string :comment, null: false, default: ''

      t.timestamps
    end
  end
end
