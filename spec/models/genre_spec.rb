require 'rails_helper'

  RSpec.describe Genre, type: :model do
    let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
    let(:video) { Video.create!(title: "Movie Title", language: "german", year: 2014, synopsis: "Test text, Test text") }
    let(:series) { Series.create!(title: "Series Title") }
    let(:genre) { Genre.create!(name: 'Comedy') }
    let(:genre2) { Genre.create!(name: 'Crime') }

    it { is_expected.to have_many :tags }
    it { is_expected.to have_many(:videos).through(:tags) }
    it { is_expected.to have_many(:series).through(:tags) }

    describe "tags" do
      it "allows the same genre to be associated with a different movie and series" do
        video.genres << genre
        series.genres << genre

        video_genre = video.genres[0]
        series_genre = series.genres[0]
        expect(video_genre).to eql(series_genre)
      end
    end

    describe ".update_genres" do
      it "takes a comma delimited string and returns an array of Genres" do
        genres = "#{genre.name}, #{genre2.name}"
        genres_as_a = [genre, genre2]
        expect(Genre.update_genres(genres)).to eq(genres_as_a)
      end
    end
 end
