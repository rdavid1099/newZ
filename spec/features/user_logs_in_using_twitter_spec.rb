require 'rails_helper'

RSpec.feature 'user can log in using Twitter' do
  before(:each) do
    create_top_stories
  end

  context 'producer logs in' do
    it 'clicks Login Using Twitter and is taken to their dashboard page' do
      VCR.use_cassette('feature_user_sees_headlines') do
        user = create_user(
          name: 'Tester',
          screen_name: 'Tester Screen Name',
          location: 'Denver, CO',
          role: 1
        ).first
        visit root_path
        click_on 'Login Using Twitter'

        expect(user.producer?).to be(true)
        expect(page).to have_content('Tester Screen Name0')
        expect(page).to have_content('Logout')
        expect(page).to have_content("Today's Top Trending Stories")
        expect(page).to have_content('Your Recent Story Pitches')
        expect(page).to have_current_path(producer_users_dashboard_path)
      end
    end
  end

  context 'viewer logs in' do
    it 'clicks Login Using Twitter and is taken to their dashboard page' do
      VCR.use_cassette('feature_user_sees_headlines') do
        user = create_user(
          name: 'Tester',
          screen_name: 'Tester Screen Name',
          location: 'Denver, CO'
        ).first
        visit root_path
        click_on 'Login Using Twitter'

        expect(user.viewer?).to be(true)
        expect(page).to have_content('Tester Screen Name0')
        expect(page).to have_content('Logout')
        expect(page).to have_content("Today's Top Trending Stories")
        expect(page).to have_content('Your Recent Story Pitches')
        expect(page).to have_current_path(users_dashboard_path)
      end
    end
  end

  context 'admin logs in' do
    it 'clicks Login Using Twitter and is taken to their dashboard page' do
      VCR.use_cassette('feature_user_sees_headlines') do
        user = create_user(
          name: 'Tester',
          screen_name: 'Tester Screen Name',
          location: 'Denver, CO',
          role: 2
        ).first
        visit root_path
        click_on 'Login Using Twitter'

        expect(user.admin?).to be(true)
        expect(page).to have_content('Tester Screen Name0')
        expect(page).to have_content('Logout')
        expect(page).to have_content("Today's Top Trending Stories")
        expect(page).to have_content('Your Recent Story Pitches')
        expect(page).to have_current_path(admin_users_dashboard_path)
      end
    end
  end
end
