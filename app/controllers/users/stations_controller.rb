class Users::StationsController < ApplicationController
  def new
    @nearby_stations = Station.near(current_user.location, 60)
  end

  def create
    current_user.set_station_subscriptions(station_ids) unless station_ids.empty?
    redirect_to users_dashboard_path
  end

  private
    def station_ids
      params.keys.map do |param|
        param unless param.to_i.zero?
      end.compact
    end
end
