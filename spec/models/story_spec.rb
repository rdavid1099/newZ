require 'rails_helper'

RSpec.describe Story, type: :model do
  it 'creates a new story using raw api data' do
    raw_data = {title:             'Title',
                abstract:          'Abstract',
                url:               'test_url.com',
                byline:            'test_authors',
                published_date:    '2016-11-02T06:13:05-04:00',
                multimedia:        []}
    story = Story.create_from_api_data(raw_data)

    expect(story.title).to eq('Title')
    expect(story.abstract).to eq('Abstract')
    expect(story.url).to eq('test_url.com')
    expect(story.authors).to eq('test_authors')
    expect(story.published_date).to eq('11-02-2016')
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:abstract) }
    it { is_expected.to validate_presence_of(:authors) }
    it { is_expected.to validate_presence_of(:raw_published_date) }
  end
end
