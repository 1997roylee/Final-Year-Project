# frozen_string_literal: true

class AuthController < ApplicationController
  before_action :find_user_by_email, only: [:login]

  # Post /auth/login
  def login
    if @user.authenticate(params[:password])
      @user.generate_auth_token
      render_ok(data: UserSerializer.new(@user))
    else
      render_errors(errors: 'Password is wrong')
    end
  end

  # Post /auth/create
  def create
    user = User.create!(params.permit(:email, :student_name, :password))
    user.generate_auth_token
    user = UserSerializer.new(user)
    render_ok(data: user)
  end

  private

  def find_user_by_email
    @user = User.find_by!(email: params[:email])
  end
end
