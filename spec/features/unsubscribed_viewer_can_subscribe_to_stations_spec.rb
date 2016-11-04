require 'rails_helper'

RSpec.feature 'unsubscribed user logs in' do
  it 'is prompted to subscribe to stations on dashboard page' do
    VCR.use_cassette('feature_user_sees_headlines') do
      user = create_user(
        name: 'Tester',
        screen_name: 'Tester Screen Name',
        location: 'Denver, CO'
      ).first
      station = create_station.first

      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit users_dashboard_path

      expect(page).to have_content('You are currently not subscribed to any stations')
      click_on 'Denver, CO'

      expect(page).to have_content('News Stations Broadcasting to Denver, CO')
      expect(page).to have_content(station.name)
    end
  end

  it 'prompts user to set location if their location is invalid or blank' do
    user = create_user(
      name: 'Tester',
      screen_name: 'Tester Screen Name',
      location: 'NotRealLocation, Na'
    ).first
    station = create_station.first

    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit users_new_station_path

    expect(page).to have_content('News Stations Broadcasting to NotRealLocation, Na')
    expect(page).to have_content('It appears there are no subscribed stations near your location.')
    expect(page).to have_content('Edit Your Location')
  end
end
