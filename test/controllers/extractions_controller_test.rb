require 'test_helper'

class ExtractionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extraction = extractions(:one)
  end

  test 'should get index' do
    get extractions_url
    assert_response :success
  end

  test 'should get new' do
    get new_extraction_url
    assert_response :success
  end

  test 'should create extraction' do
    assert_difference('Extraction.count') do
      post extractions_url, params: {extraction: {}}
    end

    assert_redirected_to extraction_url(Extraction.last)
  end

  test 'should show extraction' do
    get extraction_url(@extraction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_extraction_url(@extraction)
    assert_response :success
  end

  test 'should update extraction' do
    patch extraction_url(@extraction), params: {extraction: {}}
    assert_redirected_to extraction_url(@extraction)
  end

  test 'should destroy extraction' do
    assert_difference('Extraction.count', -1) do
      delete extraction_url(@extraction)
    end

    assert_redirected_to extractions_url
  end
end
