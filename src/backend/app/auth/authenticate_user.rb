# frozen_string_literal: true

# app/auth/authenticate_user.rb
class AuthenticateUser
  attr_reader :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    ::JsonWebToken.encode(user_id: user.id) if user
  end

  private

  # verify user credentials
  def user
    user = User.find_by(email: email)
    return user if user&.authenticate(password)

    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Messages.invalid_credentials)
  end
end
