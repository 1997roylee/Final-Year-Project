# frozen_string_literal: true

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :course_id, :comment, :created_at, :updated_at, :owner

  def owner
    {
      owner_id: object.user.id,
      owner_name: object.user.student_name
    }
  end
end
