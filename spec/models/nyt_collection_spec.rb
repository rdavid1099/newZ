require 'rails_helper'

RSpec.describe NytCollection, type: :model do
  it 'converts NYT API data into stories' do
    VCR.use_cassette('service_top_stories_test') do
      service = NytService.new
      NytCollection.upload_top_stories(service.top_stories)
      collection = NytCollection.first

      expect(NytCollection.count).to eq(1)
      expect(collection.num_results).to eq(29)
      expect(collection.stories.first.title).to eq('Iowa Police Arrest Suspect in ‘Ambush’ Killings of 2 Officers')
    end
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:copyright) }
    it { is_expected.to validate_presence_of(:num_results) }
  end
end
