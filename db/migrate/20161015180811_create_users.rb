class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :screen_name
      t.string :location
      t.string :profile_image
      t.string :uid
      t.string :twitter_url

      t.timestamps
    end
  end
end
