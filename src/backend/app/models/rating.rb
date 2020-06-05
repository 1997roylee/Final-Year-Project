# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :course
end
