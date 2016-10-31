class CreateJoinTableUserStations < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :stations do |t|
      t.index [:user_id, :station_id]
      t.index [:station_id, :user_id]
    end
  end
end
