# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :student_name, :auth_token, :is_student, :is_professor
end
