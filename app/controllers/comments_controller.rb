class CommentsController < ApplicationController
  def create
    pitch = Pitch.find(params[:comment][:pitch_id])
    new_comment = current_user.comments.create(comment_params)
    byebug
    flash[:error] = 'You must enter a comment.'
    redirect_to story_pitch_path(pitch.story.id, pitch.id)
  end

  private
    def comment_params
      {body: params[:comment][:body],
       ups:  1,
       downs: 0,
       pitch_id: params[:comment][:pitch_id]}
    end
end
