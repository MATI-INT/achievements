class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :post_achievement, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :votes, [:post_achievement_id, :user_id], unique: true
  end
end
