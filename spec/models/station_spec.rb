require 'rails_helper'

RSpec.describe Station, type: :model do
  it 'sets logo to default picture if image is not uploaded' do
    station = Station.create(name: 'TestStation',
                             url: 'http://www.teststation.com')

    expect(station.logo_path).to eq('default photo')
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:url) }
    it { is_expected.to have_many(:users) }
  end
end
