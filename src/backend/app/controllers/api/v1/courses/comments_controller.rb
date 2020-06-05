# frozen_string_literal: true

class Api::V1::Courses::CommentsController < ApplicationController
  before_action :authorize_request, only: %i[create destroy]
  before_action :find_course, only: %i[create destroy]
  # post /api/v1/courses/:course_id/comments
  def create
    render_ok(data: @current_user.comments.create!(course_id: params[:course_id], comment: params[:comment]))
  end

  # delete /api/v1/courses/:course_id/comments/:id
  def destroy
    @course.comments.find_by!(id: params[:id]).delete
    render_ok(data: 'ok')
  end

  private

  def find_course
    @course = Course.find_by!(id: params[:course_id])
  end
end
