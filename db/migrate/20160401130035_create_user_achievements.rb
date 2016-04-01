class CreateUserAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :user_achievements do |t|
      t.references :user, foreign_key: true
      t.references :achievements, foreign_key: true
    end
  end
end
