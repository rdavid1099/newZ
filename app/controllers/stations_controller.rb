class StationsController < ApplicationController
  def show
    @station = Station.find_by(call_letters: params[:id])
    not_in_viewing_error_message unless current_user.in_viewing_area?(@station.id)
  end

  private
    def not_in_viewing_error_message
      flash.now[:info] = "This station is not located in your viewing area. #{view_context.link_to 'View Stations Near You.', users_new_station_path}"
    end
end
