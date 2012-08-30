require_dependency "blogpost/application_controller"

module Blogpost
  class VotesController < ApplicationController
    def vote_up_post
      @post = Post.find(params[:id])

      if @post.votes.exists?(:user_id => current_user.id)
        puts(current_user.id)
        @notice = 'You already voted'
        puts(@notice)
      else
        a = Blogpost::Vote.new
        a.votable = @post
        a.user_id = current_user.id
        a.value = 1
        a.save!
        @id = @post.id
        @count = @post.votes.count
      end

      respond_to do |format|
        format.js
      end
    end

    def vote_up_comment
      @comment = Comments.find(params[:id])

      if @comment.votes.exists?(:user_id => current_user.id)
        @notice2 = 'You already voted'
      else
        a = Blogpost::Vote.new
        a.votable = @comment
        a.user_id = current_user.id
        a.value = 1
        a.save!
        @id2 = @comment.id
        @count2 = @comment.votes.count
      end

      respond_to do |format|
        format.js
      end
    end
  end
end
