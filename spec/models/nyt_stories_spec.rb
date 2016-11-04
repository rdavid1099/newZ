require 'rails_helper'

describe 'NYTStories' do
  it 'gets top stories' do
    VCR.use_cassette('service_top_stories_test') do
      stories = NytStories.get_top_stories

      expect(stories.stories.count).to eq(29)
      expect(stories.copyright).to eq('Copyright (c) 2016 The New York Times Company. All Rights Reserved.')
      expect(stories.num_results).to eq(29)
    end
  end
end
