class Admin::UsersController < ApplicationController
  def show
    @trending_stories = NytStories.get_top_stories
  end
end
