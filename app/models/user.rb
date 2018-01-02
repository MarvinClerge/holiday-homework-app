class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :nullify
  has_many :post_categories, through: :posts, dependent: :nullify
  has_many :categories, through: :post_categories, dependent: :nullify

  has_many :likes, dependent: :nullify
  has_many :comments, dependent: :nullify

  validates :username, uniqueness: true
  validates :username,:name,:email, presence: true

  def get_color
    case self.color
    when "blue"
      "bg-primary text-light"
    when "red"
      "bg-danger text-light"
    when "yellow"
      "bg-warning text-light"
    when "green"
      "bg-success text-light"
    end
  end

  def sorted_posts
    self.posts.sort_by do |x|
      x.created_at
    end.reverse
  end

end
