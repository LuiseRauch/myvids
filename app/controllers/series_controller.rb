class SeriesController < ApplicationController
  def index
    @all_series = Series.all
  end

  def show
    @series = Series.find(params[:id])
  end

  def search
  end

  def new
    @series = Series.new
    authorize @series
  end

  def create
    @series = Series.new(series_params)
    authorize @series

    if @series.save
      @series.genres = Genre.update_genres(params[:series][:genres])
      redirect_to movie_path(@series), notice: "Series was saved successfully."
    else
      flash.now[:alert] = "Error creating the series. Please try again."
      render :new
    end
  end

  def edit
    @series = Series.find(params[:id])
    authorize @series
  end

  def update
    @series = Series.find(params[:id])
    @series.assign_attributes(series_params)

    if @series.save
      @series.genres = Genre.update_genres(params[:series][:genres])
      flash[:notice] = "Series was updated."
      redirect_to movie_path(@series)
    else
      flash.now[:alert] = "There was an error saving the series. Please try again."
      render :edit
    end
  end

  def destroy
    @series = Series.find(params[:id])
    authorize @series

    if @series.destroy
      flash[:notice] = "\"#{@series.title}\" was deleted successfully."
      redirect_to movies_path
    else
      flash.now[:alert] = "There was an error deleting the series."
      render :show
    end
  end

  private

  def series_params
    params.require(:series).permit(:title, :synopsis)
  end
end
