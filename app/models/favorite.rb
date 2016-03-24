class Favorite < ActiveRecord::Base
  belongs_to :video
  belongs_to :series
  belongs_to :user
end
