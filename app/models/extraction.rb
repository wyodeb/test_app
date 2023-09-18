class Extraction < ApplicationRecord
  include Prozable
  validates :source, presence: true
  validate :custom_message, on: :create
  serialize :target_lang, Array

  def custom_message
    return if native_lang.present?
    errors.add(:_, 'Not enough params for creation')
  end
end
