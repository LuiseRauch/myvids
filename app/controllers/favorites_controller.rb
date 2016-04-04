class FavoritesController < ApplicationController
  def create
    @video = Video.find(params[:movie_id])
    favorite = current_user.favorites.build(video: @video)

    if favorite.save
      flash[:notice] = "Video favorited."
    else
      flash[:alert] = "Favoriting failed."
    end

    if request.referer.present?
      redirect_to(:back)
    else
      redirect_to movie_path(@video)
    end
  end

  def destroy
    # raise params.inspect
    @video = Video.find(params[:movie_id])
    favorite = current_user.favorites.find(params[:id])
    # raise favorite.inspect

    if favorite.destroy
      flash[:notice] = "Video unfavorited."
    else
      flash[:alert] = "Unfavoriting failed."
    end

    if request.referer.present?
      redirect_to(:back)
    else
      redirect_to movie_path(@video)
    end
  end
end
