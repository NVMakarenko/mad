# frozen_string_literal: true

require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get locations_index_url
    assert_response :success
  end

  test 'should get import' do
    get locations_import_url
    assert_response :success
  end
end
