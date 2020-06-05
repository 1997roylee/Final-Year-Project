# frozen_string_literal: true

class NotificationTweet
  def initialize(course_id)
    @course = Course.find_by!(id: course_id)
  end

  # should be called as a job
  def call(message)
    ids = @course.enrols.select(:user_id) .pluck(:user_id)
    ids.each do |id|
      ::Notification.create(user_id: 1, target_id: id, message: message)
    end
    true
  end
end
