class UserAchievement < ApplicationRecord
  belongs_to :user
  belongs_to :achievements
end