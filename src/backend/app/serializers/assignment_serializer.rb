# frozen_string_literal: true

class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :description, :submit_at, :created_at, :updated_at, :title
  attribute :attachment_url do
    'http://localhost:3000' + object.attachment_url || ''
  end
end
