class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :ups
      t.integer :downs
      t.integer :parent_id
      t.integer :child_id
      t.references :pitch, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
