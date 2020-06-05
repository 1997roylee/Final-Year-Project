# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id, null: false
      t.integer :target_id, null: false
      t.string :message, null: false, default: ''
      t.boolean :is_read, null: false, default: false
      t.string :link, null: false, default: ''

      t.index ['user_id'], name: 'index_notifications_on_user_id'
      t.index ['target_id'], name: 'index_notifications_on_target_id'

      t.timestamps
    end
  end
end
