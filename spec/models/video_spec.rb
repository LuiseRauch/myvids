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

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_least(1) }

  it { is_expected.to validate_presence_of(:language) }

  it { is_expected.to validate_presence_of(:year) }
  it { should validate_numericality_of(:year) }
  it { should_not allow_value(999).for(:year) }
  it { should allow_value(1000).for(:year) }


  it { is_expected.to validate_presence_of(:synopsis) }
  it { is_expected.to validate_length_of(:synopsis).is_at_least(20) }

  describe "attributes for movie" do
    it "should respond to title" do
      expect(movie).to have_attributes(:title)
    end
    it "should respond to language" do
      expect(movie).to have_attributes(:language)
    end
    it "should respond to year" do
      expect(movie).to have_attributes(:year)
    end
    it "should respond to synopsis" do
      expect(movie).to have_attributes(:synopsis)
    end
  end

  # describe "attributes for episode" do
  #   it "should respond to title" do
  #     expect(episode).to have_attributes(:title)
  #   end
  #   it "should respond to synopsis" do
  #     expect(episode).to have_attributes(:synopsis)
  #   end
  # end
end
