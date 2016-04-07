class PostAchievement < ApplicationRecord
  belongs_to :post
  belongs_to :achievement
end