class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @rooms = User.where(is_admin: true).limit(10)
  end

  def user_profile_show
    @user = User.find(params[:user_id])
  end

  def user_profile_edit
    @user = User.find(params[:user_id])
  end

  def user_profile_update
    @user = User.find(params[:user_id])
    @user.update(params_user)

    render 'user_profile_edit'
  end

  def search
    # STEP 1
    if params[:search_specialite].present? && params[:search_specialite].strip != ""
      session[:search_specialite] = params[:search_specialite]
    end

    # STEP 2
    if session[:search_specialite] && session[:search_specialite] != ""
     # @users_specialities = UsersSpeciality.where(active: true).near(session[:loc_search], 5, order: 'distance')
     @users_specialities = UsersSpeciality.all
    else
      #@users_specialities = Room.where(active: true).all
      @users_specialities = UsersSpeciality.all
    end

    @arrUsers_specialities = @users_specialities.to_a

    # STEP 4
  end

  private

  def params_user
    params.require(:user).permit(:username, :city, :address, :latitude, :longitude, :photo, :first_name, :last_name, :phone_number)
  end
end
