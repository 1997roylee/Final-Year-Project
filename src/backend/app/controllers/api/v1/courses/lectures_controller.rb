# frozen_string_literal: true

class Api::V1::Courses::LecturesController < ApplicationController
  before_action :authorize_request, only: %i[create index update destroy]
  before_action :find_course, only: %i[create index update destroy]
  # # get /api/v1/courses/:course_id/lectures
  # def index
  # end

  # post /api/v1/courses/:course_id/lectures
  def create
    lecture = @course.lectures.create!(course_params)
    NotificationTweet.new(@course.id).call("Course #{@course.course_title}: A new lecture is created!")
    render_ok(data: lecture)
  end

  # patch /api/v1/courses/:course_id/lectures/:id
  def update; end

  # delete /api/v1/courses/:course_id/lectures/:id
  def destroy
    @course.lectures.find_by!(id: params[:id]).destroy!
    render_ok(data: 'ok')
  end

  private

  def course_params
    params.permit(:lecture, :title, :description, :duration, :start_at, :end_at)
  end

  def find_course
    @course = Course.find_by!(id: params[:course_id])
  end
end
