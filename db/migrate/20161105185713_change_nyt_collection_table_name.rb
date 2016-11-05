class ChangeNytCollectionTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :nyt_collection, :nyt_collections

    add_reference :stories, :nyt_collection, foreign_key: true
  end
end
