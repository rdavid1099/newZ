require 'rails_helper'

describe 'viewer subscribes to station on dashboard' do
  it 'clicks subscribe and is returned to station dashboard' do
    user = create_user(
      name: 'Tester',
      screen_name: 'Tester Screen Name',
      location: 'Denver, CO'
    ).first
    station = create_station.first

    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit station_path(station.call_letters)
    click_on 'Subscribe'

    expect(current_path).to eq(station_path(station.call_letters))
    expect(user.stations.last).to eq(station)
    expect(page).to have_button('Unsubscribe')    
    expect(page).to_not have_button('Subscribe')
  end
end
