require 'rails_helper'

RSpec.describe Station, type: :model do
  it 'sets logo to default picture if image is not uploaded' do
    VCR.use_cassette('station_user_tests') do
      station = Station.create(name: 'TestStation',
                               city: 'Denver',
                               state: 'CO',
                               zipcode: '80201',
                               url: 'http://www.teststation.com')

      expect(station.logo_path).to eq('default photo')
    end
  end

  it 'sets geocoded location after creation' do
    VCR.use_cassette('station_user_tests') do
      
    end
  end
end
