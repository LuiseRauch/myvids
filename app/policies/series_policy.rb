class SeriesPolicy < ApplicationPolicy
  def index?
    user.present?
  end
end
