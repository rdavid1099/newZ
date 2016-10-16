class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string :name
      t.string :url
      t.string :logo_path
      
      t.timestamps
    end
  end
end
