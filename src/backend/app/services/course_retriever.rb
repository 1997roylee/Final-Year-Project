# frozen_string_literal: true

class CourseRetriever
  def initialize(user)
    @user = user
  end

  def available
    ids = get_user_enrolment
    Course.where.not(id: ids).limit(20)
  end

  def enroled
    ids = get_user_enrolment
    Course.includes([:comments]).includes(:ratings).where(id: ids).map do |item|
      item.has_rated = !item.ratings.where(user_id: @user.id).select(:id).empty?
      item
    end
  end

  private

  def get_user_enrolment
    @user.enrols.select(:course_id).pluck(:course_id)
  end
end
