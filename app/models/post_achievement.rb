class PostAchievement < ApplicationRecord
  has_many :votes
  belongs_to :post, optional: true
  belongs_to :achievement, optional: true
end