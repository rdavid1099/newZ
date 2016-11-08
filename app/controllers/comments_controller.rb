class CommentsController < ApplicationController
  def create
    pitch = Pitch.find(params[:comment][:pitch_id])
    comment = pitch.comments.new(comment_params)
    unless comment.save
      flash[:error] = 'You must enter a comment.'
    end
    redirect_to story_pitch_path(pitch.story.id, pitch.id)
  end

  private
    def comment_params
      {body: params[:comment][:body],
      user_id: current_user.id}
    end
end
