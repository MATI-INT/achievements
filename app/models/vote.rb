class Vote < ApplicationRecord
  belongs_to :post_achievement, optional: true
  belongs_to :user, optional: true

  validates :user, uniqueness: {scope: :post_achievement}
end
