class Producer::UsersController < ApplicationController
  def show
    @story_collection = NytCollection.last
  end
end
