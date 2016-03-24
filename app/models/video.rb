class Video < ActiveRecord::Base
  belongs_to :season
  has_many :tags, as: :tagable
  has_many :genres, through: :tags
  has_many :favorites, dependent: :destroy
end
