class FavoritesController < ApplicationController
  def create
    @video = Video.find(params[:movie_id])
    favorite = current_user.favorites.build(video: @video)

    if favorite.save
      flash[:notice] = "Video favorited."
    else
      flash[:alert] = "Favoriting failed."
    end
    redirect_to movie_path(@video)
  end

  def destroy
    @video = Video.find(params[:movie_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Video unfavorited."
    else
      flash[:alert] = "Unfavoriting failed."
    end
    redirect_to movie_path(@video)
  end
end
