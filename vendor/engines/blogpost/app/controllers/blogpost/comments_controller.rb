require_dependency "blogpost/application_controller"

module Blogpost
  class CommentsController < ApplicationController
    def create
      #@post = Post.find(params[:post_id])
      #@comment = @post.comments.build(params[:comment])
      #@comment.user = current_user.becomes Blogpost::User
      #@comment.save
      #redirect_to post_path(@post)
    end
  end
end
