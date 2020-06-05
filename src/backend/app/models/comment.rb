# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :comment, length: { minimum: 0 }
end
