# frozen_string_literal: true

require 'test_helper'

class MagnetometersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get magnetometers_index_url
    assert_response :success
  end
end
