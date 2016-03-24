class MoviesController < ApplicationController
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def search
  end

  def new
    # @season = Season.find(params[:season_id])
    @video = Video.new
  end

  def create
    # @season = Season.find(params[:season_id])
    @video = Video.new(video_params)

    if @video.save
      # @video.genres = Genre.update_genres(params[:video][:genres])
      @video.genres = Genre.update_genres(params[:genres])
      redirect_to action: :index, notice: "Video was saved successfully."
    else
      flash.now[:alert] = "Error creating Movie. Please try again."
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.assign_attributes(video_params)

    if @video.save
      flash[:notice] = "Video was updated."
      redirect_to @video
    else
      flash.now[:alert] = "There was an error saving the video. Please try again."
      render :edit
    end
  end
end

private

def video_params
  params.permit(:title, :language, :year, :synopsis)
end
