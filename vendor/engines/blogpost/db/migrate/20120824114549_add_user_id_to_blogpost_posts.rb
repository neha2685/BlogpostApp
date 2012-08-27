class AddUserIdToBlogpostPosts < ActiveRecord::Migration
  def change
    add_column :blogpost_posts, :user_id, :integer
  end
end
