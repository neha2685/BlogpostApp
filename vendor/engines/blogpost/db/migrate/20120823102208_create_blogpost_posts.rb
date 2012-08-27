class CreateBlogpostPosts < ActiveRecord::Migration
  def change
    create_table :blogpost_posts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
