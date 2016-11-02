class AddCallLettersToStations < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :call_letters, :string
  end
end
