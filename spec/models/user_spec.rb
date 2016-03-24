require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:favorites) }

  describe "#favorite_for(video)" do
  before do
    video = Video.create!(title: "Movie Title")
  end

  it "returns `nil` if the user has not favorited the post" do
    expect(user.favorite_for(video)).to be_nil
  end

  it "returns the appropriate favorite if it exists" do
    favorite = user.favorites.where(video: video).create
    expect(user.favorite_for(video)).to eq(favorite)
  end
end
end
