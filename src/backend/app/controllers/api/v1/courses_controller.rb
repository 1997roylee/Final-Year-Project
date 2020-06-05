# frozen_string_literal: true

class Api::V1::CoursesController < ApplicationController
  before_action :authorize_request, only: %i[create index]
  # Get /api/v1/courses
  def index
    courses = ActiveModel::SerializableResource.new(
      ::CourseRetriever.new(@current_user).available,
      adapter: :json_api,
      each_serializer: CourseSerializer
    )

    render_ok(data: courses.as_json[:data])
  end

  # get /api/v1/courses/:id
  def show
    course = Course.includes(:comments).includes(:lectures).includes(comments: :user).includes(lectures: :assignments).find_by!(id: params['id'])
    render_ok(data: CourseSerializer.new(course))
  end

  def update
    course = Course.find_by!(id: params[:id])
    course.update!(course_update_params(params))
    render_ok(data: course.reload)
  end

  # Post /api/v1/courses
  def create
    courseInfo = Course.create!(course_params)
    render_ok(data: courseInfo)
  end

  private

  def course_params
    params.permit(:course_title, :course_number, :course_image_url, :category_id, :course_description, :course_level, :course_language)
  end

  def course_update_params(params)
    {
      course_title: params[:course_title],
      course_description: params[:course_description]
    }.delete_if { |_k, v| v.nil? }
  end
end
