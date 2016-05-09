class AddCommunityToAchievements < ActiveRecord::Migration[5.0]
  def change
    add_column :achievements, :community, :boolean, default: false
  end
end
