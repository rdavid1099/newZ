class UsersController < ApplicationController
  before_action :station_subscriptions?, only: [:show]

  def show
    @story_collection = NytCollection.last
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:info] = 'You successfully updated your profile'
      redirect_to users_dashboard_path
    else
      flash.now[:danger] = current_user.errors.full_messages.join(', ')
      render :edit
    end
  end

  private
    def station_subscriptions?
      if current_user.stations.empty?
        flash.now[:info] = "You are currently not subscribed to any stations in your area.\n" +
        "Subscribe to stations around #{view_context.link_to current_user.location, users_new_station_path}"
        .html_safe
      end
    end

    def user_params
      params.require(:user).permit(:name, :screen_name, :location)
    end
end
