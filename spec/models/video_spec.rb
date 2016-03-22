require 'rails_helper'

RSpec.describe Video, type: :model do
  it { is_expected.to have_many(:tags) }
  it { is_expected.to have_many(:genres).through(:tags) }
end
