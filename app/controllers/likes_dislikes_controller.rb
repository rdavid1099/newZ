class LikesDislikesController < ApplicationController
  def create
    current_user.mark_like_dislike(likes_dislikes_params)
    redirect_back(fallback_location: pitches_path)
  end

  private
    def likes_dislikes_params
      {ups: params[:like],
      downs: params[:dislike],
      pitch_id: params[:pitch_id],
      comment_id: params[:comment_id]}
    end
end
