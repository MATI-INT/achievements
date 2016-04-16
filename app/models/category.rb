class Category < ApplicationRecord
  has_many :posts

  validates :title, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 2}
end