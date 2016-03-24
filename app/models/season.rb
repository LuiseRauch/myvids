class Season < ActiveRecord::Base
  belongs_to :series
  has_many :videos

  validates :series, presence: true
end
