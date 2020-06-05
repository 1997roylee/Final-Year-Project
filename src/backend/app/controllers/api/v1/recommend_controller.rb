# frozen_string_literal: true

class Api::V1::RecommendController < ApplicationController
  before_action :authorize_request, only: %i[index]
  #   Get /api/v1/recommend
  def index
    courses = ::RecommenderEngine.new(User.first).recommend
    return render_ok(data: []) if courses.nil?

    courses = ActiveModel::SerializableResource.new(
      courses,
      adapter: :json_api,
      each_serializer: CourseSerializer
    )

    render_ok(data: courses.as_json[:data])
  end
end
