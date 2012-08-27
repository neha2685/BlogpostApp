require 'test_helper'

module Blogpost
  class WelcomeControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
