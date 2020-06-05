# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :enrols
  has_many :ratings
  has_many :comments
  has_many :notifications, foreign_key: 'target_id'

  attr_reader :full_name
  # validates :last_name, :first_name, presence: :true
  validates :student_name, presence: true
  validates :email, :password, presence: true, on: :create
  validates :password, length: { in: 8..20 }, on: :create
  validates :email, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
  has_many :rating

  def generate_auth_token
    update_attribute(:auth_token, ::JsonWebToken.encode({ user_id: id }))
  end

  # def full_name
  #   "#{first_name} #{last_name}"
  # end
end
