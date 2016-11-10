class User < ApplicationRecord
  has_many :stations_users
  has_many :stations, through: :stations_users
  has_many :pitches
  has_many :comments
  has_many :likes_dislikes
  enum role: [:viewer, :producer, :admin]

  validates :screen_name, presence: true
  validates :name, presence: true

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

  def subscribed?(station_id)
    stations.where('id = ?', station_id).present? && viewer?
  end

  def set_station_subscriptions(station_ids)
    station_ids.each do |id|
      stations << Station.find(id)
    end
  end

  def station_unsubscribe(station_id)
    stations.delete(station_id)
  end

  def in_viewing_area?(station_id)
    !Station.near(location, 60).empty?
  end

  def mark_like_dislike(params)
    if relevant_likes_dislike(params[:pitch_id], params[:comment_id]).nil?
      likes_dislikes.create(params)
    else
      update_like_dislike(params)
    end
  end

  private
    def relevant_likes_dislike(pitch_id, comment_id)
      likes_dislikes.where('pitch_id = ? OR comment_id = ?',
                            pitch_id,
                            comment_id).first
    end

    def update_like_dislike(params)
      relevant_likes_dislike(params[:pitch_id], params[:comment_id]).update(params)
    end
end
