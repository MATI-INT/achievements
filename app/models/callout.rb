class Callout < ApplicationRecord
  has_many :category_callouts
  has_many :categories, through: :category_callouts

  dragonfly_accessor :image

  validates :url, presence: true

  validates_property :width, of: :image, as: 200 # , in: (0..400)
  validates_property :height, of: :image, as: 200
  # jpg, bmp, png
  # other validations: https://markevans.github.io/dragonfly/models#validations
end
