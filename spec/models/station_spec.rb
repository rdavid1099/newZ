require 'rails_helper'

RSpec.describe Station, type: :model do
  it 'sets logo to default picture if image is not uploaded' do
    VCR.use_cassette('station_user_tests') do
      station = create_station.first

      expect(station.logo_path).to eq('default photo')
    end
  end

  it 'sets geocoded location after creation' do
    VCR.use_cassette('station_location_tests') do
      station = create_station.first
      user = create_user.first

      expect(station.full_street_address).to eq('Denver, CO. 80201')
      expect(Station.near(user.location, 20).first).to eq(station)
    end
  end
end
