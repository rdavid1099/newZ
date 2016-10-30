class AddLocationToStations < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :city, :string
    add_column :stations, :state, :string
    add_column :stations, :zipcode, :string
    add_column :stations, :latitude, :float
    add_column :stations, :longitude, :float
  end
end
