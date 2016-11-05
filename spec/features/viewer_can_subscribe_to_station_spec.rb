require 'rails_helper'

describe 'viewer subscribes to a station' do
  before(:each) do
    create_top_stories
  end

  it 'sees the subscribed station on their dashboard' do
    VCR.use_cassette('feature_user_sees_headlines') do
      user = create_user(
        name: 'Tester',
        screen_name: 'Tester Screen Name',
        location: 'Denver, CO',
        role: 0
      ).first
      station = create_station.first

      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit users_new_station_path
      check station.id
      click_on 'Subscribe'

      expect(current_path).to eq(users_dashboard_path)
      expect(page).to have_content('Your Station Subscriptions')
      within('.subscribed') do
        expect(page).to have_content(station.name)
        expect(page).to have_content('Subscribers: 1')
      end
    end
  end

  it 'does not see subscribed stations on their dashboard' do
    VCR.use_cassette('feature_user_sees_headlines') do
      user = create_user(
        name: 'Tester',
        screen_name: 'Tester Screen Name',
        location: 'Denver, CO',
        role: 0
      ).first
      station = create_station.first

      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit users_new_station_path
      click_on 'Subscribe'

      expect(current_path).to eq(users_dashboard_path)
      expect(page).to have_content('Your Station Subscriptions')
      within('.subscribed') do
        expect(page).to have_content('Subscribe to Stations')
        expect(page).to_not have_content(station.name)
        expect(page).to_not have_content('Subscribers: 1')
      end
    end
  end
end
