require 'rails_helper'

RSpec.describe Video, type: :model do
  let(:series) { create(:series) }
  let(:season) { create(:season, series: series) }
  let(:user) { create(:user) }
  let(:movie) { create(:video) }
  let(:episode) { create(:video, season: season) }

  it { is_expected.to have_many(:tags) }
  it { is_expected.to have_many(:genres).through(:tags) }
  it { is_expected.to have_many(:favorites) }

  describe "attributes for movie" do
    it "should respond to title" do
      expect(movie).to respond_to(:title)
    end
    it "should respond to synopsis" do
      expect(movie).to respond_to(:synopsis)
    end
  end

  describe "attributes for episode" do
    it "should respond to title" do
      expect(episode).to respond_to(:title)
    end
    it "should respond to synopsis" do
      expect(episode).to respond_to(:synopsis)
    end
  end

end
