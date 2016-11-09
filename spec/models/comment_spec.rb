require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'creates a to a parent comment' do
    user = create_user.first
    create_pitch(user)
    comment = create_comment({pitch: Pitch.last, user: user})

    reply = comment.post_reply({body: 'This is a reply',
                                user_id: user.id})

    expect(comment.replies.first.body).to eq('This is a reply')
    expect(reply.parent.body).to eq('This is a test comment 0')
  end
end
