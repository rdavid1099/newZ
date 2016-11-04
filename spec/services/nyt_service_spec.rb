require 'rails_helper'

describe 'nyt service' do
  it 'returns top trending stories' do
    VCR.use_cassette('service_top_stories_test') do
      service = NytService.new
      response = service.top_stories

      expect(response[:num_results]).to eq(29)
      expect(response[:results].first[:title]).to eq('Iowa Police Arrest Suspect in ‘Ambush’ Killings of 2 Officers')
    end
  end
end
