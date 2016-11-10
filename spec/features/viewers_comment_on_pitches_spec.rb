require 'rails_helper'

describe 'viewer clicks on pitch comments' do
  it 'submits a new comment on the pitch' do
    user = create_user.first
    create_pitch(user)

    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit story_pitch_path(Story.first.id, Pitch.first.id)

    within('.comments') do
      fill_in 'comment_body', with: 'This is a test comment'
      click_on 'Submit'
    end

    expect(current_path).to eq(story_pitch_path(Story.first.id, Pitch.first.id))

    within('.comments') do
      expect(page).to have_content('This is a test comment')
      expect(page).to have_content('0 Likes')
      expect(page).to have_content('0 Dislikes')
      expect(page).to have_content('Reply')
    end
  end
end
