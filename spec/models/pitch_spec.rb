require 'rails_helper'

RSpec.describe Pitch, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:headline) }
    it { is_expected.to validate_presence_of(:story_url) }
    it { is_expected.to validate_presence_of(:abstract) }
  end
end
