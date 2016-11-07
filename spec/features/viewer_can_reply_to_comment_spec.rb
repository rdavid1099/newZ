require 'rails_helper'

describe 'viewer replies to comment' do
  it 'clicks reply and fills form to submit comment' do
    user = create_user.first
    create_pitch(user)

    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit story_pitch_path(Story.first.id, Pitch.first.id)

  end
end
