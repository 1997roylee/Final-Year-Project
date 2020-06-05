# frozen_string_literal: true

class Api::V1::Courses::Lectures::AssignmentsController < ApplicationController
  before_action :authorize_request, only: %i[create update destroy]
  before_action :find_lectures, only: %i[create destroy]

  # post /api/v1/courses/:course_id/lectures/:lecture_id/assignments
  def create
    assignment = @lecture.assignments.create!(get_params)
    NotificationTweet.new(@course.id).call("Course #{@course.course_title}: A new assignment is uploaded!")
    render_ok(data: assignment)
  end

  # patch /api/v1/courses/:course_id/lectures/:lecture_id/assignments/:id
  def update; end

  # delete /api/v1/courses/:course_id/lectures/:lecture_id/assignments/:id
  def destroy
    @lecture.assignments.find_by!(id: params[:id]).delete
    render_ok(data: 'ok')
  end

  private

  def get_params
    params.permit(:title, :description, :submit_at, :attachment)
  end

  def find_lectures
    @course = Course.find_by!(id: params[:course_id])
    @lecture = @course.lectures.find_by!(id: params[:lecture_id])
  end
end
