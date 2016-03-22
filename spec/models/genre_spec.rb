require 'rails_helper'

  RSpec.describe Genre, type: :model do
    let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }

    let(:genre) { Genre.create!(name: 'Comedy') }
    let(:genre2) { Genre.create!(name: 'Crime') }

    it { is_expected.to have_many :tags }
    it { is_expected.to have_many(:videos).through(:tags) }

    # describe "tags" do
    #   it "allows the same label to be associated with different videos" do
    #   end
    # end

    describe ".update_genres" do
      it "takes a comma delimited string and returns an array of Genres" do
        genres = "#{genre.name}, #{genre2.name}"
        genres_as_a = [genre, genre2]
        expect(Genre.update_genres(genres)).to eq(genres_as_a)
      end
    end
 end
