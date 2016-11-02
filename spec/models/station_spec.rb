require 'rails_helper'

RSpec.describe Station, type: :model do
  it 'sets logo to default picture if image is not uploaded' do
    station = create_station.first

    expect(station.logo_path).to eq('default photo')
  end

  it 'sets geocoded location after creation' do
    station = create_station.first
    user = create_user.first

    expect(station.full_street_address).to eq('Denver, CO. 80201')
    expect(Station.near(user.location, 20).first).to eq(station)
  end

  it 'returns the number of subscribed viewers' do
    user = create_user.first
    station = create_station.first

    expect(station.num_of_subscribers).to eq(0)

    user.stations << station

    expect(station.num_of_subscribers).to eq(1)
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:url) }
    it { is_expected.to validate_presence_of(:call_letters) }
    it { is_expected.to validate_uniqueness_of(:call_letters) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:zipcode) }
    it { is_expected.to have_many(:users) }
  end
end
