# frozen_string_literal: true

class Lecture < ApplicationRecord
  has_many :assignments, dependent: :destroy
  belongs_to :course

  validates :lecture, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
end
