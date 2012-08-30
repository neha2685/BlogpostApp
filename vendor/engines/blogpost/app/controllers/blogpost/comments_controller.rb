require_dependency "blogpost/application_controller"

module Blogpost
  class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id ])
      @comment = Blogpost::Comments.new()
      @comment.post = @post
      @comment.body = params[:comments][:body]
      @comment.user = current_user.becomes Blogpost::User
      if @comment.save
        redirect_to post_path(@post)
      end
    end
  end
end
