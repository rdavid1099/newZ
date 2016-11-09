require 'rails_helper'

describe 'viewer likes a pitch' do
  it 'clicks like and sees the number change' do
    user = create_user.first
    create_pitch(user)

    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit story_pitch_path(Story.first.id, Pitch.first.id)

    within('.ups') do
      click_on '0 Likes'
    end

    expect(page).to have_content('1 Like')
    expect(page).to have_content('0 Dislikes')
  end
end
