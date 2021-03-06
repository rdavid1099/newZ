require 'rails_helper'

describe 'viewer can pitch story' do
  before(:each) do
    create_top_stories
  end

  it 'clicks pitch link from dashboard' do
    VCR.use_cassette('feature_user_sees_headlines') do
      user = create_user.first

      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit users_dashboard_path

      within('.trending-stories') do
        first('.story').click_link('Pitch Story')
      end

      fill_in 'pitch_body', with: 'Test Story Pitch'
      click_on 'Pitch Story'

      expect(current_path).to eq(story_pitch_path(Story.first.id, Pitch.first.id))
      expect(page).to have_css('.headline')
      expect(page).to have_css('.story_url')
      expect(page).to have_css('.abstract')
      expect(page).to have_css('.body')
      expect(page).to have_css('.ups')
      expect(page).to have_css('.downs')
      expect(page).to have_css('.comments')
    end
  end
end
