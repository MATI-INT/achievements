class CreateAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :achievements do |t|
      t.string :title
      t.text :description
      t.string :image_uid

      t.timestamps
    end
  end
end
