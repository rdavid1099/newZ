require 'rails_helper'

describe 'viewer replies to comment' do
  it 'clicks reply and fills form to submit comment' do
    user = create_user.first
    create_pitch(user)
    create_comment({pitch: Pitch.last, user: user})

    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit story_pitch_path(Story.first.id, Pitch.first.id)
    within('.comments') do
      click_on 'Reply'
      fill_in 'reply_body', with: 'This is a test reply'
      click_on 'Post Reply'
    end

    within('.comments') do
      expect(page).to have_content('This is a test comment')
      expect(page).to have_content('This is a test reply')
    end
  end
end
