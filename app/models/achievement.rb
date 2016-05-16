class Achievement < ApplicationRecord
  dragonfly_accessor :image

  THRESHOLD = 1
  validates :title, presence: true
  validates :description, presence: true

  validates_presence_of :image
  #validates_size_of :image, maximum: 500.kilobytes
  validates_property :format, of: :image, in: ['jpeg', 'png', 'gif']
  #validates_property :width, of: :image, in: (0..400)
  scope :community, -> { where(community: true) }
  scope :user_defined, -> { where(community: false) }

  belongs_to :user, optional: true # TODO: remove it

  has_many :post_achievements, dependent: :destroy
  has_many :posts, through: :post_achievements

  def votes_for(post)
    self.post_achievements.find_by(post: post).votes.count
  end

  def assigned_for?(post)
    votes_for(post) >= THRESHOLD
  end
end
