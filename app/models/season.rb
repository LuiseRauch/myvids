class Season < ActiveRecord::Base
  belongs_to :series
  has_many :videos

  accepts_nested_attributes_for :series

  validates :series, presence: true
end
