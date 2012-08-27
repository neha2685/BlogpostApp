require_dependency "blogpost/application_controller"

module Blogpost
  class PostsController < ApplicationController
    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(params[:post])
      @post.user = current_user.becomes Blogpost::User

      if @post.save
        redirect_to :action => :show, :id => @post.id
      else
        render 'new'
      end
    end

    def show
      @post = Post.find(params[:id])
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      redirect_to :action => :index
    end
  end
end