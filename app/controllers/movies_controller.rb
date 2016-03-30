class MoviesController < ApplicationController
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def search
    # params[:title]
    # params[:actor]
  end

  def new
    # @season = Season.find(params[:season_id])
    @video = Video.new
  end

  def create
    # @season = Season.find(params[:season_id])
    @video = Video.new(video_params)

    if @video.save
      @video.genres = Genre.update_genres(params[:video][:genres])
      redirect_to movie_path(@video), notice: "Video was saved successfully."
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
      @video.genres = Genre.update_genres(params[:video][:genres])
      flash[:notice] = "Video was updated."
      redirect_to movie_path(@video)
    else
      flash.now[:alert] = "There was an error saving the video. Please try again."
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])

    if @video.destroy
      flash[:notice] = "\"#{@video.title}\" was deleted successfully."
      redirect_to movies_path
    else
      flash.now[:alert] = "There was an error deleting the video."
      render :show
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :language, :year, :synopsis)
  end
end
