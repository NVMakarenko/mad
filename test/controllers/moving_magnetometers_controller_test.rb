# frozen_string_literal: true

require 'test_helper'

class MovingMagnetometersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get moving_magnetometers_index_url
    assert_response :success
  end

  test 'should get import' do
    get moving_magnetometers_import_url
    assert_response :success
  end
end
