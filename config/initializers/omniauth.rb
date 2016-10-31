Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER-API-KEY'], ENV['TWITTER-API-SECRET'],
    {
      secure_image_url: 'true',
      image_size: 'original',
      authorize_params: {
        force_login: 'true'
      }
    }
end
