class Series < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  has_many :tags, as: :tagable
  has_many :genres, through: :tags
  has_many :favorites, dependent: :destroy

  # accepts_nested_attributes_for :seasons, allow_destroy: true, reject_if: :all_blank
end
