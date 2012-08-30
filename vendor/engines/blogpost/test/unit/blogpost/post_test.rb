require 'test_helper'

module Blogpost
  class PostTest < ActiveSupport::TestCase
    test "should not save post without title" do
      post = Post.new
      assert !post.save
    end
  end
end
