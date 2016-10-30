class UsersController < ApplicationController
  before_action :station_subscriptions?, only: [:show]

  def show
  end

  private
    def station_subscriptions?
      if current_user.stations.empty?
        flash.now[:info] = "You are currently not subscribed to any stations in your area.\n" +
        "Subscribe to stations around #{view_context.link_to current_user.location, users_new_station_path}"
        .html_safe
      end
    end
end
