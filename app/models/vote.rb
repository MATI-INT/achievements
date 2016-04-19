class Vote < ApplicationRecord
  belongs_to :achievement, optional: true
  belongs_to :user, optional: true

  validates :user, uniqueness: {scope: :achievement}
end
