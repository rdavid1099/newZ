require 'rails_helper'

describe 'user unsubscribes from station on station dashboard' do
  it 'clicks unsubscribe and is taken back to the station dashbaord' do
    user = create_user(
      name: 'Tester',
      screen_name: 'Tester Screen Name',
      location: 'Denver, CO',
      role: 0
    ).first
    station = create_station.first
    user.stations << station

    visit station_path(station.call_letters)
    click_on 'Unsubscribe'

    expect(current_path).to eq(station_path(station.call_letters))
    expect(page).to have_button('Subscribe')
    expect(page).to_not have_button('Unsubscribe')
    expect(user.stations.count).to eq(0)
  end
end
