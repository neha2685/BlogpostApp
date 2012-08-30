module Blogpost
  module ApplicationHelper
    def owner?(id)
      if current_user.id == id
        return true
      else
        return false
      end
    end

    def votedPost?(id)
      @post = Post.find(id)
      if @post.votes.exists?(:user_id => current_user.id)
        return true
      else
        return false
      end
    end

    def votedComment?(id)
      @comment = Comments.find(id)
      if @comment.votes.exists?(:user_id => current_user.id)
        return true
      else
        return false
      end
    end

    def date?(date)
      return date.strftime("%Y-%m-%d")
    end

    def time?(date)
      return date.strftime("%I:%M %P")
    end
  end
end
