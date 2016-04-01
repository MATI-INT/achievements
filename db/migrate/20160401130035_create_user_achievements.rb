class CreateUserAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :user_achievements do |t|
      t.belongs_to :user, index: true
      t.belongs_to :achievement, index: true
    end
  end
end
