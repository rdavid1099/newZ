class Station < ApplicationRecord
  has_many :stations_users
  has_many :users, through: :stations_users
end
