class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true # TODO: remove it
  has_many :post_achievements
  has_many :achievements, through: :post_achievements
  has_many :comments

  #scope :received_achievements, achievements

  validates :title, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 2}

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
