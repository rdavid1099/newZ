class LikesDislikesController < ApplicationController
  def create
    byebug
    LikesDislike.create(likes_dislikes_params)
    redirect_back(fallback_location: pitches_path)
  end

  private
    def likes_dislikes_params
      {ups: params[:like],
      downs: params[:dislike],
      user_id: current_user.id,
      pitch_id: params[:pitch_id],
      comment_id: params[:comment_id]}
    end
end
