require 'rails_helper'

describe 'NYTStory' do
  it 'has all the attributes of a single story' do
    VCR.use_cassette('service_top_stories_test') do
      stories = NytStories.get_top_stories
      story = stories.stories.first

      expect(story.title).to eq('Iowa Police Arrest Suspect in ‘Ambush’ Killings of 2 Officers')
      expect(story.abstract).to eq('The officers were shot early Wednesday in Des Moines and in Urbandale. A suspect, described as a troubled loner familiar to the police, soon surrendered.')
      expect(story.url).to eq('http://www.nytimes.com/2016/11/03/us/police-iowa-ambush-killed.html')
      expect(story.authors).to eq('By MITCH SMITH, RICHARD PÉREZ-PEÑA and JONAH ENGEL BROMWICH')
      expect(story.published_date).to eq('11-02-2016')
      expect(story.thumbnail_url).to eq('https://static01.nyt.com/images/2016/11/02/us/02xp-desMoines/02xp-desMoines-thumbStandard.jpg')
      expect(story.image_url).to eq('https://static01.nyt.com/images/2016/11/02/us/02xp-desMoines/02xp-desMoines-articleInline.jpg')
    end
  end
end
