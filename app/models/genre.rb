class Genre < ActiveRecord::Base
  has_many :tags
  has_many :videos, through: :tags, source: :tagable, source_type: :Video
  has_many :series, through: :tags, source: :tagable, source_type: :Series

  def self.update_genres(genre_string)
    return Genre.none if genre_string.blank?
    genre_string.split(",").map do |genre|
      Genre.find_or_create_by(name: genre.strip)
    end
  end
end
