# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :render_errors
    rescue_from ExceptionHandler::AuthenticationError, with: :render_errors
    rescue_from ExceptionHandler::MissingToken, with: :render_errors
    rescue_from ExceptionHandler::InvalidToken, with: :render_errors

    rescue_from StandardError do |ex|
      Rails.logger.error format('%s (%s):', ex.class.name, ex.message)
      Rails.logger.error ex.backtrace.join("\n")
      render_errors(errors: ex.message)
    end

    rescue_from ActiveRecord::RecordNotFound do |ex|
      Rails.logger.error format('%s (%s):', ex.class.name, ex.message)
      Rails.logger.error ex.backtrace.join("\n")
      render_errors(errors: ex.message)
    end

    rescue_from ActiveRecord::RecordInvalid do |ex|
      logger.error format('%s (%s):', ex.class.name, ex.message)
      logger.error ex.backtrace.join("\n")
      render_errors(errors: ex.message)
    end

    rescue_from ActiveRecord::StatementInvalid do |ex|
      render_errors(errors: ex.message)
    end

    rescue_from ActiveRecord::RecordNotFound do |ex|
      render_errors(errors: ex.message)
    end

    rescue_from ActiveModel::ValidationError do |ex|
      logger.error format('%s (%s):', ex.class.name, ex.message)
      logger.error ex.backtrace.join("\n")
      render_errors(errors: ex.message)
    end

    rescue_from ActiveRecord::RecordNotUnique do |ex|
      Rails.logger.error format('%s (%s):', ex.class.name, ex.message)
      Rails.logger.error ex.backtrace.join("\n")

      render_errors(errors: ex.message, code: 403)
    end
  end

  #  private
  #  def handle_errors(error)
  #   render_errors(errors: error)
  #  end
end
