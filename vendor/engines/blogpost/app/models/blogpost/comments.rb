module Blogpost
  class Comments < ActiveRecord::Base
    attr_accessible :body

    belongs_to :post, :class_name => Blogpost::Post, :polymorphic => true
    belongs_to :user, :class_name => Blogpost::User
  end
end
