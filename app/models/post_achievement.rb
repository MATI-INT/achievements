class PostAchievement < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :achievement, optional: true
end