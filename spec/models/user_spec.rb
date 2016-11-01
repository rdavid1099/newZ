require 'rails_helper'

RSpec.describe User, type: :model do
  it 'sets station subscriptions using array of station ids' do
    user = create_user.first
    create_station({}, 2)
    station_ids = Station.all.pluck(:id)
    user.set_station_subscriptions(station_ids)

    expect(user.stations.count).to eq(2)
  end

  it 'returns boolean on user subscribed to specific station' do
    user = create_user.first
    station = create_station.first

    expect(user.subscribed?(station.id)).to eq(false)

    user.stations << station

    expect(user.subscribed?(station.id)).to eq(true)
  end

  it 'unsubscribes viewers from stations' do
    user = create_user.first
    station = create_station.first
    user.stations << station
    user.station_unsubscribe(station.id)

    expect(user.subscribed?(station.id)).to eq(false)
    expect(user.stations.count).to eq(0)
  end

  context 'validations' do
    it { is_expected.to have_many(:stations) }
  end
end
