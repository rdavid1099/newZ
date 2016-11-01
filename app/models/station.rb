class Station < ApplicationRecord
  has_many :stations_users
  has_many :users, through: :stations_users

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :logo_path, presence: true
  validates :call_letters, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  geocoded_by :full_street_address

  before_validation :set_logo
  after_validation :geocode

  def full_street_address
    "#{city}, #{state}. #{zipcode}"
  end

  def num_of_subscribers
    users.where('role = ?', '0').count
  end

  private
    def set_logo
      self.logo_path ||= 'default photo'
    end
end
