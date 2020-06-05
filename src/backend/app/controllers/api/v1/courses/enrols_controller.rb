# frozen_string_literal: true

class Api::V1::Courses::EnrolsController < ApplicationController
  before_action :authorize_request, only: %i[create update index]
  before_action :find_course, only: %i[create update]

  # Get /api/v1/enrols
  def index
    courses = ActiveModel::SerializableResource.new(
      ::CourseRetriever.new(@current_user).enroled,
      adapter: :json_api,
      each_serializer: CourseSerializer
    )
    render_ok(data: courses.as_json[:data])
  end

  # post /api/v1/courses/:id/enrols
  def create
    record = @current_user.enrols.create!(course_id: params[:course_id])
    Course.transaction do
      @course.update(enrol_count: @course.enrol_count + 1)
    end

    render_ok(data: record)
  end

  def update; end

  private

  def find_course
    @course = Course.find_by!(id: params[:course_id])
  end
end
