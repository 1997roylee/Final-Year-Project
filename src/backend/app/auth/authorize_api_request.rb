# frozen_string_literal: true

class AuthorizeApiRequest
  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def call
    {
      user: user
    }
  end

  private

  def user
    user_id = decoded_auth_token[:user_id]
    @user ||= User.find_by(id: user_id)
  rescue NoMethodError => e
    raise(
      ExceptionHandler::InvalidToken,
      Messages.invalid_token.to_s
    )
  rescue ActiveRecord::RecordNotFound => e
    raise(
      ExceptionHandler::InvalidToken,
      "#{Messages.invalid_token} #{e.message}"
    )
  end

  def decoded_auth_token
    if http_auth_header
      @decoded_auth_token ||= ::JsonWebToken.decode(http_auth_header)
    end
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end

    nil
  end
end
