class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :abstract
      t.string :url
      t.string :authors
      t.string :published_date
      t.string :thumbnail_url
      t.string :image_url

      t.timestamps
    end
  end
end
