class CreateNytStories < ActiveRecord::Migration[5.0]
  def change
    create_table :nyt_collection do |t|
      t.string :copyright
      t.integer :num_results

      t.timestamps
    end
  end
end
