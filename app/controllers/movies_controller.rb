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
    @video = Video.new
    @season = Season.new
    @series = Series.new
    authorize @video
  end

  def create
    # raise params.inspect
    # if params[:video][:series].present?
    #   @series = Series.create(params[:video][:series])
    # end
    # if params[:video][:season].present?
    #   @season = @series.seasons.create(params[:video][:season])
    # end
    @video = Video.new(video_params)
    # @video.season = @season
    authorize @video

    if @video.save
      @video.genres = Genre.update_genres(params[:video][:genres])
      redirect_to movie_path(@video), notice: "Movie was saved successfully."
    else
      flash.now[:alert] = "Error creating Movie. Please try again."
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
    authorize @video
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
    authorize @video

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
    params.require(:video).permit(:title, :language, :year, :synopsis, :season_id, season_attributes: [:number, series_attributes: [:title, :synopsis]])
  end
end
