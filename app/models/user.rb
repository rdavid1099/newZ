class User < ApplicationRecord
  has_many :stations_users
  has_many :stations, through: :stations_users
  enum role: [:viewer, :producer, :admin]

  def self.from_omniauth(auth_info, role = nil)
    user = User.find_or_create_by(uid: auth_info.uid)
    user.name = auth_info.extra.raw_info.name
    user.screen_name = auth_info.extra.raw_info.screen_name
    user.location = auth_info.extra.raw_info.location
    user.profile_image = auth_info.extra.raw_info.profile_image_url
    user.twitter_url = auth_info.info.urls['Twitter']
    user.oauth_token = auth_info.credentials.token
    user.oauth_secret = auth_info.credentials.secret
    user.role = role || user.role || 0
    user.save
    user
  end

  def set_station_subscriptions(station_ids)
    station_ids.each do |id|
      stations << Station.find(id)
    end
  end
end
