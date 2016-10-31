require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to have_many(:stations) }
  end
end
