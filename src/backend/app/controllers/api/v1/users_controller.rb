# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :authorize_request, only: %i[me update index]
  before_action :find_user_by_id, only: :show
  # Get /api/v1/users/:id
  def show
    render_ok(data: UserSerializer.new(@user))
  end

  # Get /api/v1/users/me
  def me
    render_ok(data: UserSerializer.new(@current_user))
  end

  # Patch /api/v1/users/me
  def update
    @current_user.update!(users_params(params))

    render_ok(data: UserSerializer.new(@current_user.reload))
  end

  #   def create; end
  private

  def users_params(params)
    {
      student_name: params[:student_name],
      is_student: params[:is_student],
      is_professor: params[:is_professor]
    }.delete_if { |_k, v| v.nil? }
  end

  def find_user_by_id
    @user = User.find_by!(id: params['id'])
  end
end
