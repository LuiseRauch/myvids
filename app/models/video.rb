class Video < ActiveRecord::Base
  has_many :tags, as: :tagable
  has_many :genres, through: :tags
end
