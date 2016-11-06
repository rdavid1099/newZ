class CreatePitches < ActiveRecord::Migration[5.0]
  def change
    create_table :pitches do |t|
      t.string :headline
      t.string :story_url
      t.string :abstract
      t.string :body
      t.integer :ups
      t.integer :downs
      t.references :user, foreign_key: true
      t.references :story, foreign_key: true

      t.timestamps
    end
  end
end
