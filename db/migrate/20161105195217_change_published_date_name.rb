class ChangePublishedDateName < ActiveRecord::Migration[5.0]
  def change
    rename_column :stories, :published_date, :raw_published_date
  end
end
