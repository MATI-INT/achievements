class Category < ApplicationRecord
  has_many :posts
  has_many :visits, dependent: :destroy

  has_many :category_callouts
  has_many :callouts, through: :category_callouts

  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 2}

  scope :top, -> do
    select("categories.id, categories.title, count(posts.id) AS posts_count").
        left_outer_joins(:posts).
        group("categories.id").
        order("posts_count DESC")#.limit(5)
  end
end
