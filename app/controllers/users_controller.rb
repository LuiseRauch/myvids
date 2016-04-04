class UsersController < ApplicationController
  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.all
    end
  end

  def edit
    @user = User.find(params[:id])
    # authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)

    if @user.save
      flash[:notice] = "User was updated."
      redirect_to users_path(@user)
    else
      flash.now[:alert] = "There was an error saving the user. Please try again."
      render :edit
    end
  end

  def show
    @user = current_user
    @user_favorited_videos = @user.favorites.collect(&:video)
    # @user_favorited_series = @user.favorites.collect(&:series)
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:notice] = "\"#{@user.username}\" was deleted successfully."
      redirect_to users_path
    else
      flash.now[:alert] = "There was an error deleting the user."
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :approved)
  end
end
