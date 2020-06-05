# frozen_string_literal: true

class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :title, null: false, default: ''
      t.string :description, null: false, default: ''
      t.string :attachment_url, null: false, default: ''
      t.datetime :submit_at, null: false
      t.integer :lecture_id, null: false

      t.index ['lecture_id'], name: 'index_assignments_on_lecture_id'
      t.timestamps
    end
  end
end
