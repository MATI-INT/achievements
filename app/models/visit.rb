class Visit < ApplicationRecord
  belongs_to :category
  belongs_to :post, optional: true
  belongs_to :user, optional: true
end
