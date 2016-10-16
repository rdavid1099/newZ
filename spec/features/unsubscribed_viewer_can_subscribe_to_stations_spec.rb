require 'rails_helper'

RSpec.feature 'unsubscribed user logs in' do
  it 'is prompted to subscribe to stations on dashboard page' do
    user = create_user(
      name: 'Tester',
      screen_name: 'Tester Screen Name',
      location: 'Denver, CO'
    ).first

    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit users_dashboard_path

    expect(page).to have_content('You are currently not subscribed to any local stations')
    click_on 'Denver, CO'

    expect(page).to have_content('News Stations in Denver, CO')
  end
end

# If I don't have a location listed on my Twitter profile
# I expect to be taken to a page asking me to enter my zipcode or City and State where I live
