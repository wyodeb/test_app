class Extraction < ApplicationRecord
  include Prozable
  validates :source, presence: true
  # validates :source, format: { with: /\b[A-Z0-9._%a-z\-]+@xyz\.com\z/, message: "must be a xyz.com account" }
  validate :custom_message, on: :create
  serialize :target_lang, Array

  def custom_message
    return if native_lang.present?
    errors.add(:_, 'Not enough params for creation')
  end
end
