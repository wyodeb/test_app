require 'rails_helper'

RSpec.describe Extraction, type: :model do
  subject do
    described_class.new(
      source:      'https://www.proz.com/translator/88393',
      first_name:  'Mariette',
      last_name:   'van, Heteren',
      country:     'Netherlands',
      native_lang: 'Dutch'
    )
  end

  it 'is invalid without params' do
    expect(described_class.new).not_to be_valid
  end

  it 'is not valid without a source' do
    subject.source = nil
    expect(subject).not_to be_valid
  end

  it 'is valid with valid params' do
    expect(subject).to be_valid
  end

  it 'adds record to DB' do
    expect { subject.save }.to change(described_class, :count).by(1)
  end
end
