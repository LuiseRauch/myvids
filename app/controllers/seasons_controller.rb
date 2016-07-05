class SeasonsController < ApplicationController
  def index
    if params[:series].present?
      @series = Series.find(params[:series])
      @seasons = @series.seasons

      respond_to do |format|
        format.js { render 'seasons_for_select' }
      end
    else
      render status: :ok, json: nil
    end
  end

  def show
    @season = Season.find(params[:id])
  end

  def new
    @series = Series.find(params[:series_id])
    @season = @series.seasons.build(season_params)
  end

  def create
    @series = Series.find(params[:series_id])
    @season = @series.season.build(season_params)
    # authorize @season

    if @season.save
      redirect_to [@series, @season], notice: "Season was saved successfully."
    else
      flash.now[:alert] = "Error creating the season. Please try again."
      render :new
    end
  end

  def edit
    @season = Season.find(params[:id])
    # authorize @season
  end

  def update
    @season = Season.find(params[:id])
    @season.assign_attributes(season_params)

    if @season.save
      flash[:notice] = "Season was updated."
      redirect_to redirect_to [@season.series, @season]
    else
      flash.now[:alert] = "There was an error saving the season. Please try again."
      render :edit
    end
  end

  def destroy
    @season = Season.find(params[:id])
    # authorize @season

    if @season.destroy
      flash[:notice] = "Season was deleted successfully."
      redirect_to @season.series
    else
      flash.now[:alert] = "There was an error deleting the season."
      render :show
    end
  end

  private

  def season_params
    params.require(:season).permit(:number, :series_id)
  end
end
