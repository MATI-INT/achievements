class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end

    add_index :comments, [:user_id, :post_id]
  end
end
