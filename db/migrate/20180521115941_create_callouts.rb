class CreateCallouts < ActiveRecord::Migration[5.2]
  def change
    create_table :callouts do |t|
      t.text :description
      t.string :url
      t.string :image_uid

      t.timestamps
    end
  end
end
