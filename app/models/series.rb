class Series < ActiveRecord::Base
  has_many :seasons
  has_many :tags, as: :tagable
  has_many :genres, through: :tags
  has_many :favorites, dependent: :destroy
end
