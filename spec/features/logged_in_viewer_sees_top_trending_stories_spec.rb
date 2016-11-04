require 'rails_helper'

describe 'viewer sees trending stories on dashboard' do
  it 'sees list of five headlines' do
    VCR.use_cassette('feature_user_sees_headlines') do
      user = create_user.first

      ApplicationController.any_instance.stubs(:logged_in?).returns(true)
      ApplicationController.any_instance.stubs(:current_user).returns(user)

      visit users_dashboard_path
      within('.trending-stories') do
        expect(page).to have_link('Iowa Police Arrest Suspect in ‘Ambush’ Killings of 2 Officers')
        expect(page).to have_link('Why Sexual Harassment Persists in Politics')
        expect(page).to have_link('Veterans, Feeling Abandoned, Stand by Donald Trump')
        expect(page).to have_link('California Today: An Invasive Beetle Threatens State’s Southern Palm Trees')
        expect(page).to have_link('Obama Faults F.B.I. on Emails, Citing')
      end
    end
  end
end
