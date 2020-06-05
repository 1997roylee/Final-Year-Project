# frozen_string_literal: true

class RemoveAttachmentUrlOnAssignments < ActiveRecord::Migration[6.0]
  def change
    remove_column :assignments, :attachment_url
  end
end
