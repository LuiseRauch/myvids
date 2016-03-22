class MoviesController < ApplicationController
  def index
  end

  def show
  end

  def search
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      @video.genres = Genre.update_genres(params[:video][:genres])
      redirect_to @viedeo, notice: "Video was saved successfully."
    else
      flash.now[:alert] = "Error creating Movie. Please try again."
      render :new
    end
  end

  def edit
  end
end
