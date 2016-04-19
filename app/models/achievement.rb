class Achievement < ApplicationRecord
  dragonfly_accessor :image

  validates :title, presence: true
  validates :description, presence: true

  validates_presence_of :image
  #validates_size_of :image, maximum: 500.kilobytes
  validates_property :format, of: :image, in: ['jpeg', 'png', 'gif']
  #validates_property :width, of: :image, in: (0..400)

  belongs_to :user, optional: true # TODO: remove it

  has_many :post_achievements
  has_many :posts, through: :post_achievements

  has_many :votes
end
