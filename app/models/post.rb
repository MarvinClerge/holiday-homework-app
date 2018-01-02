class Post < ApplicationRecord
  belongs_to :user
  has_many :post_categories, dependent: :delete_all
  has_many :categories, through: :post_categories, dependent: :delete_all

  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  validates :title,:content, presence: true

  def summary
    if self.content.length > 150
      "#{self.content[0..149]} ..."
    else
      self.content
    end
  end

  def show_likes
    if self.likes.count == 0
      ""
    elsif self.likes.count == 1
      "1 like"
    elsif self.likes.count > 1
      "#{self.likes.count} likes"
    end
  end

  def likes_and_views
    phrase = ""
    if self.likes.count == 1
      phrase += "1 like "
    elsif self.likes.count > 1
      phrase += "#{self.likes.count} likes "
    end

    if self.views == 1
      phrase += "1 view"
    elsif self.views > 1
      phrase += "#{self.views} views"
    end
  end

  def sorted_comments
    self.comments.sort_by do |x|
      x.created_at
    end.reverse
  end
end
