require 'rails_helper'

describe 'viewer can pitch story' do
  xit 'clicks pitch link from dashboard' do
    VCR.use_cassette('feature_user_sees_headlines') do
      user = create_user.first

      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit users_dashboard_path

      within('.trending-stories') do
        first('.story').click_link('Pitch Story')
      end
      fill_in 'story_comment', with: 'Test Story Pitch'
      click_on 'Pitch Story'

      expect(current_path).to eq(users_pitch(Pitch.first.id))
      expect(page).to have_css('.headline')
      expect(page).to have_css('.story_url')
      expect(page).to have_css('.abstract')
      expect(page).to have_css('.user_comment')
      expect(page).to have_css('.ups')
      expect(page).to have_css('.downs')
      expect(page).to have_css('.comments')
    end
  end
end
