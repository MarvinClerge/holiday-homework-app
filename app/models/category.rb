class Category < ApplicationRecord
  has_many :post_categories, dependent: :delete_all
  has_many :posts, through: :post_categories, dependent: :delete_all
  has_many :users, through: :posts, dependent: :delete_all

  def top_3_posts
    top = self.posts.sort_by {|post| post.views}
    top = top[0..2]
  end


end
