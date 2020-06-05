# frozen_string_literal: true

class LectureSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :lecture, :start_at, :end_at, :created_at, :updated_at, :assignments
  has_many :assignments

  def assignments
    object.assignments.map do |item|
      AssignmentSerializer.new item
    end
  end
end
