ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

VCR.configure do |config|
  #Ignoring calls to location API
  config.ignore_request do |request|
    URI(request.uri).host == 'maps.googleapis.com'
  end

  config.cassette_library_dir = "./spec/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

def mock_twitter_login(params = Hash.new, uid = '787348724179533825')
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:twitter] = omniauth_mock(params, uid)
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
      name: (params[:name] || 'Twitter Tester') + n.to_s,
      screen_name: (params[:screen_name] || 'TestTwitter') + n.to_s,
      location: (params[:location] || 'Denver, CO')
    }
    mock_twitter_login(info, n) if amount == 1
    users << User.from_omniauth(omniauth_mock(info, n), params[:role])
  end
  users
end

def create_station(params = Hash.new, amount = 1)
  stations = Array.new
  amount.times do |n|
    info = {
      name: (params[:name] || 'TestStation') + n.to_s,
      city: (params[:city] || 'Denver'),
      state: (params[:state] || 'CO'),
      zipcode: (params[:zipcode] || '80201'),
      call_letters: (params[:call_letters] || 'KABC') + n.to_s,
      url: (params[:url] || 'http://www.teststation.com') + n.to_s
    }
    stations << Station.create(info)
  end
  stations
end

def create_pitch(user, params = Hash.new, amount = 1)
  amount.times do |n|
    info = {
      headline: (params[:headline] || 'Test Story') + n.to_s,
      story_url: (params[:story_url] || 'story.com/testing'),
      abstract: (params[:abstract] || 'story testing is really fun'),
      body: (params[:body] || 'testing pitches'),
      story_id: create_story.id,
      ups: (params[:ups] || 1),
      downs: (params[:downs] || 0)
    }
    user.pitches << Pitch.create(info)
  end
end

def create_story
  a = Story.create(
    title: 'Test Story',
    abstract: 'story testing is really fun',
    url: 'story.com/testing',
    authors: 'Steve and Greg',
    raw_published_date: '2016-11-02T06:13:05-04:00',
    nyt_collection_id: create_nyt_collection.id
  )
end

def create_nyt_collection
  NytCollection.create(
    copyright: '2016',
    num_results: 1
  )
end

def create_top_stories
  VCR.use_cassette('service_top_stories_test') do
    service = NytService.new
    NytCollection.upload_top_stories(service.top_stories)
  end
end

def destroy_top_stories
  unless NytCollection.all.empty?
    NytCollection.all.each { |collection| collection.stories.delete_all }
    NytCollection.delete_all
  end
end
