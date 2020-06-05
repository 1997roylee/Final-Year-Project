# frozen_string_literal: true

class Api::V1::Courses::RatingsController < ApplicationController
  before_action :authorize_request, only: :create
  before_action :find_course, only: :create
  # post /api/v1/courses/ratings
  def create
    record = @current_user.ratings.create!(course_id: params[:course_id], rating: params[:rating])
    Course.transaction do
      @course.update(reviews_count: @course.reviews_count + 1, rating_score: @course.rating_score + params[:rating])
    end
    render_ok(data: record)
  end

  private

  def find_course
    @course = Course.find_by!(id: params[:course_id])
  end
end
