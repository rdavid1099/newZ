class Station < ApplicationRecord
  has_many :stations_users
  has_many :users, through: :stations_users

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :logo_path, presence: true

  before_validation :set_logo

  private

  def set_logo
    self.logo_path ||= 'default photo'
  end
end
