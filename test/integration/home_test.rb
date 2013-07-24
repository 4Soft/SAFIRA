require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test 'shows home' do
    visit '/'
  end
end
