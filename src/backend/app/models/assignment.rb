# frozen_string_literal: true

class Assignment < ApplicationRecord
  include Rails.application.routes.url_helpers

  attr_reader :attachment_url
  belongs_to :lecture
  has_one_attached :attachment

  validates :title, presence: true
  validates :description, presence: true
  validates :submit_at, presence: true

  validate :attachment_mime_type

  def attachment_url
    rails_blob_path(attachment, disposition: 'attachment', only_path: true)
  end

  private

  def attachment_mime_type
    if !attachment.attached? || !attachment.content_type.in?(%w[application/msword application/pdf application/vnd.openxmlformats-officedocument.wordprocessing])
      errors.add(:attachment, 'Must be a PDF or a WORD file')
    end
  end
end
