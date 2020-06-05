# frozen_string_literal: true

require 'JWT'

class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  attr_reader :current_user

  private

  def authorize_request
    @current_user = ::AuthorizeApiRequest.new(request.headers).call[:user]
  end
end
