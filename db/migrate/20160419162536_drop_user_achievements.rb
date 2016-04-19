class DropUserAchievements < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_achievements
    add_column :achievements, :user_id, :integer, index: true
  end
end
