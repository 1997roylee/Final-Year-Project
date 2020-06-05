# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :category_name, nil: false, limit: 50
      t.string :category_tags, nil: false, limit: 256, default: ''

      t.index ['category_name'], name: 'index_categories_on_cateogry_name', unique: true
      t.index ['parent_id'], name: 'index_categories_on_parent_id'
      t.timestamps
    end
  end
end
