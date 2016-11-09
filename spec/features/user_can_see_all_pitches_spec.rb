require 'rails_helper'

describe 'user sees all pitches' do
  it 'visits pitch index and can navigate to pitch show' do
    user = create_user.first
    create_pitch(user)

    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit pitches_path

    click_on Pitch.last.headline

    expect(page).to have_content(Pitch.last.headline)
    expect(page).to have_content('Comments')
  end
end
