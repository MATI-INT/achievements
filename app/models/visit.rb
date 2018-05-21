class Visit < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :post, optional: true
  belongs_to :user, optional: true

  scope :all_from_category, ->(category_id) do
    left_outer_joins(:post).
        where("posts.category_id = ? OR visits.category_id = ?", category_id, category_id)
  end
end
