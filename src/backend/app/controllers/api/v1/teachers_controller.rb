# frozen_string_literal: true

class Api::V1::TeachersController < ApplicationController
  before_action :authorize_request, only: %i[index]
  # get /api/v1/teachers
  def index
    courses = ActiveModel::SerializableResource.new(
      Course.all.order(:updated_at),
      adapter: :json_api,
      each_serializer: CourseSerializer
    )

    render_ok(data: courses.as_json[:data])
  end
end
