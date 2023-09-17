require 'application_system_test_case'

class ExtractionsTest < ApplicationSystemTestCase
  setup do
    @extraction = extractions(:one)
  end

  test 'visiting the index' do
    visit extractions_url
    assert_selector 'h1', text: 'Extractions'
  end

  test 'should create extraction' do
    visit extractions_url
    click_on 'New extraction'

    click_on 'Create Extraction'

    assert_text 'Extraction was successfully created'
    click_on 'Back'
  end

  test 'should update Extraction' do
    visit extraction_url(@extraction)
    click_on 'Edit this extraction', match: :first

    click_on 'Update Extraction'

    assert_text 'Extraction was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Extraction' do
    visit extraction_url(@extraction)
    click_on 'Destroy this extraction', match: :first

    assert_text 'Extraction was successfully destroyed'
  end
end
