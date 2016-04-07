class CreatePostAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :post_achievements do |t|
      t.belongs_to :achievement, index: true
      t.belongs_to :post, index: true
    end
  end
end
