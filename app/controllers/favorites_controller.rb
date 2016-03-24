class FavoritesController < ApplicationController
  before_action :require_sign_in

  def create
    video = Video.find(params[:video_id])
    favorite = current_user.favorites.build(video: video)

    if favorite.save
      flash[:notice] = "Video favorited."
    else
      flash[:alert] = "Favoriting failed."
    end
    redirect_to [video]
  end

  def destroy
    video = Video.find(params[:video_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Video unfavorited."
    else
      flash[:alert] = "Unfavoriting failed."
    end
    redirect_to [video]
  end
end
