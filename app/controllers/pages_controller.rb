class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def user_profile_edit
    @user = User.find(params[:user_id])
  end

  def user_profile_update
    @user = User.find(params[:user_id])
    @user.update(params_user)

    render 'user_profile_edit'
  end

  private

  def params_user
    params.require(:user).permit(:username, :city, :address, :latitude, :longitude, :photo)
  end
end
