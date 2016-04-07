class Post < ApplicationRecord
  belongs_to :user
  has_many :post_achievements
  has_many :achievements, through: :post_achievements

  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 2}

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
