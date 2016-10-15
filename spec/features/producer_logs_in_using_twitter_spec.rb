require 'rails_helper'

RSpec.feature 'user can log in using Twitter' do
  it 'clicks Login Using Twitter and is taken to their dashboard page' do
    mock_twitter_login
    user = create_user(
      name: 'Tester',
      screen_name: 'Tester Screen Name',
      location: 'Denver, CO'
    )
    visit root_path
    click_on 'Login Using Twitter'

    expect(page).to have_content('Tester Screen Name1')
    expect(page).to have_content('Logout')
    expect(page).to have_content("Today's Top Trending Stories on CNN")
    expect(page).to have_content('Your Recent Story Pitches')
    expect(page).to have_current_path(users_dashboard_path)
  end
end
