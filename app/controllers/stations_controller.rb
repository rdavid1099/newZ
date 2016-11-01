class StationsController < ApplicationController
  def show
    @station = Station.find_by(call_letters: params[:id])
  end
end
