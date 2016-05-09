class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :achievements
  has_many :posts
  has_many :votes
  has_many :comments

  def voted_for?(ach, post)
    post_achievement = PostAchievement.find_by(post: post, achievement: ach)
    votes.any? {|v| v.post_achievement == post_achievement }
  end
end
