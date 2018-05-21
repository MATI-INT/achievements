class Category < ApplicationRecord
  has_many :posts
  has_many :visits, dependent: :destroy

  has_many :category_callouts
  has_many :callouts, through: :category_callouts

  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 2}
end
