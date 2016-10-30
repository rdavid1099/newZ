class Users::StationsController < ApplicationController
  def new
    @nearby_stations = Station.near(current_user.location, 60)
  end
end
