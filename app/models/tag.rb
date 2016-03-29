class Tag < ActiveRecord::Base
  belongs_to :tagable, polymorphic: true
  belongs_to :genre

  # accepts_nested_attributes_for :genre, :reject_if => :all_blank
end
