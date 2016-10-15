class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    user = User.find_or_create_by(uid: auth_info.uid)
    user.name = auth_info.extra.raw_info
    user.screen_name = auth_info.extra.raw_info.screen_name
    user.location = auth_info.extra.raw_info.location
    user.profile_image = auth_info.extra.raw_info.profile_image_url
    user.twitter_url = auth_info.info.urls['Twitter']
    user.oauth_token = auth_info.credentials.token
    user.oauth_secret = auth_info.credentials.secret
    user.save
    user
  end
end
