# frozen_string_literal: true

class Api::V1::NotificationsController < ApplicationController
  before_action :authorize_request, only: %i[index create]
  # get /api/v1/notifications
  def index
    notifications = @current_user.notifications
    data = notifications.order(:is_read)
    total_count = notifications.where(is_read: false).count

    render_ok(data: data, total_count: total_count)
  end

  # post /api/v1/notifications
  def create
    @current_user.notifications.update_all(is_read: true)
    render_ok(data: 'ok')
  end
end
