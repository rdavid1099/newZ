require 'rails_helper'

describe 'viewer sees trending stories on dashboard' do
  it 'sees list of five headlines' do
    VCR.use_cassette('feature_user_sees_headlines') do
      user = create_user.first

      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit users_dashboard_path

      within('.trending-stories') do
        expect(page).to have_content('1. CNN Story 1')
        expect(page).to have_content('2. CNN Story 1')
        expect(page).to have_content('3. CNN Story 1')
        expect(page).to have_content('4. CNN Story 1')
        expect(page).to have_content('5. CNN Story 1')
      end
    end
  end
end
