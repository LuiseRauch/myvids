class Video < ActiveRecord::Base
  belongs_to :season
  has_many :tags, as: :tagable
  has_many :genres, through: :tags
  has_many :favorites, dependent: :destroy

  # accepts_nested_attributes_for :genres, :reject_if => :all_blank, :allow_destroy => true
  # accepts_nested_attributes_for :tags, :reject_if => :all_blank, :allow_destroy => true

  # validates :title, length: { minimum: 1, maximum: 100 }, presence: true
  # validates :year, length: { minimum: 4, maximum: 4 }, presence: true
  # validates :synopsis, length: { minimum: 20 }, presence: true
  # validates :language, inclusion: { in: [0, 1] }
  # validates :language, inclusion: { in: [:english, :german] }

  enum language: [:english, :german]
end
