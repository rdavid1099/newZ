class StoriesController < ApplicationController
  def index
    @story_collection = NytCollection.last
  end
end
