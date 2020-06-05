# frozen_string_literal: true

class CourseSerializer < ActiveModel::Serializer
  attributes :id, :course_title, :course_number, :course_description, :course_duration, :course_image_url, :course_level, :course_language, :category_id, :enrol_count, :category_name, :created_at, :has_rated, :reviews_count, :rating_score
  has_many :comments
  has_many :lectures

  def lectures
    object.lectures.order(:lecture)
  end
end
