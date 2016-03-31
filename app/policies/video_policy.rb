class VideoPolicy < ApplicationPolicy
  def index?
    user.present?
  end
end
