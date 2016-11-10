require 'rails_helper'

describe 'user sees all trending stories' do
  before(:each) do
    create_top_stories
  end

  it 'can view all trending stories and pitch them as necessary' do
    user = create_user.first

    ApplicationController.any_instance.stubs(:logged_in?).returns(true)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit stories_path

    expect(page).to have_content('Top Trending Stories')
  end
end
