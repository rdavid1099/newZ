require 'rails_helper'

RSpec.feature 'user can log in using Twitter' do
  it 'clicks Login Using Twitter and is taken to their dashboard page' do
    user = create_user
    visit root_path
    click_on 'Login Using Twitter'

    expect(page).to have_content(user.username)
    expect(page).to have_content('Logout')
    expect(page).to have_content("Today's Top Trending Stories on CNN")
    expect(page).to have_content("Your Recent Story Pitches")
    expect(page).to have_current_path(viewer_dashboard_path)
  end
end
