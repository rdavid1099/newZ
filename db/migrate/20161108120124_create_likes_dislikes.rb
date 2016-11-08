class CreateLikesDislikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes_dislikes do |t|
      t.boolean :ups
      t.boolean :downs
      t.references :user, foreign_key: true
      t.references :pitch, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
