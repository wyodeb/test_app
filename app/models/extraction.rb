class ExtractionValidator < ActiveModel::Validator
  include Prozable
  def validate(record)
    return unless :source == 'Invalid profile link'
    record.errors.add :source, 'Provide a name starting with X, please!'
  end
end

class Extraction < ApplicationRecord
  validates :source, presence: true
  validates_with ExtractionValidator
end
