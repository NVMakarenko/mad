# frozen_string_literal: true

require 'test_helper'

class MagsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get mags_index_url
    assert_response :success
  end
end
