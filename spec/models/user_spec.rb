require 'rails_helper'

RSpec.describe User, type: :model do
  it 'sets station subscriptions using array of station ids' do
    user = create_user.first
    create_station({}, 2)
    station_ids = Station.all.pluck(:id)
    user.set_station_subscriptions(station_ids)

    expect(user.stations.count).to eq(2)
  end

  context 'validations' do
    it { is_expected.to have_many(:stations) }
  end
end
