class CommentsController < ApplicationController
  def create
    pitch = Pitch.find(params[:comment][:pitch_id])
    if params[:commit] == 'Submit'
      comment = pitch.comments.new(comment_params)
      flash[:error] = 'You must enter a comment.' unless comment.save
    elsif params[:commit] == 'Reply'
      parent = Comment.find(params[:comment][:reply_id])
      flash[:error] = 'You must enter a comment.' unless parent.post_reply(reply_params)
    end
    redirect_to story_pitch_path(pitch.story.id, pitch.id)
  end

  private
    def comment_params
      {body: params[:comment][:body],
      user_id: current_user.id}
    end

    def reply_params
      {body: params[:comment][:body],
      user_id: current_user.id}
    end
end
