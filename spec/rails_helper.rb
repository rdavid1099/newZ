ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

VCR.configure do |config|
  config.cassette_library_dir = "./spec/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

def mock_twitter_login
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:twitter] = omniauth_mock
end

def omniauth_mock(params = Hash.new, uid = '787348724179533825')
  OmniAuth::AuthHash.new({
    provider: 'twitter',
    extra: {
      raw_info: {
        name: params[:name] || 'Twitter Tester',
        screen_name: params[:screen_name] || 'TestTwitter',
        location: params[:location] || 'Denver, CO',
        profile_image_url: 'profile_image_url'
      },
    },
    info: {
      urls: {
        'Twitter' => 'https://twitter.com'
      },
    },
    credentials: {
      token: ENV['TEST_TWITTER_TOKEN'],
      secret: ENV['TEST_TWITTER_SECRET_TOKEN']
    },
    uid: uid
  })
end

def create_user(params = Hash.new, amount = 1)
  users = Array.new
  amount.times do |n|
    info = {
      name: "#{params[:name]}#{n}" || 'Twitter Tester',
      screen_name: "#{params[:screen_name]}#{n}" || 'TestTwitter',
      location: "#{params[:location]}#{n}" || 'Denver, CO'
    }
    users << User.from_omniauth(omniauth_mock(info, n))
  end
  users
end
