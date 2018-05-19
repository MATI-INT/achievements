class Category < ApplicationRecord
  has_many :posts
  has_many :visits, dependent: :destroy

  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 2}
end
