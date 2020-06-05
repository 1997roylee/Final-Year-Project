# frozen_string_literal: true

class Enrol < ApplicationRecord
  belongs_to :user
  belongs_to :course
end
