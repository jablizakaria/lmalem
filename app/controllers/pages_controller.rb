class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def home
    @rooms = User.where(is_admin: true).limit(10)
  end

  def user_profile_show
    @user = User.find(params[:user_id])
    @users_specialities = policy_scope(UsersSpeciality).where(user: @user)
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
    if params[:search_specialite] && params[:search_lieu]  && !params[:search_specialite].empty? && !params[:search_lieu].empty?

        @near_users = User.near(params[:search_lieu], 5, order: 'distance')

     @spec=Speciality.find_by_name(params[:search_specialite])

      @users_specialities=UsersSpeciality.where(user_id: @near_users.map {|x| x.id} ).where(speciality_id:  @spec.id)



    elsif params[:search_specialite] && params[:search_lieu]  && params[:search_specialite].empty? && !params[:search_lieu].empty?
        @near_users = User.near(params[:search_lieu], 5, order: 'distance')
        @users_specialities=UsersSpeciality.where(user_id: @near_users.map {|x| x.id} )


    elsif params[:search_specialite] && params[:search_lieu]  && !params[:search_specialite].empty? && params[:search_lieu].empty?

      @spec=Speciality.find_by_name(params[:search_specialite])
      @users_specialities=UsersSpeciality.where(speciality_id:  @spec.id)


else

      @users_specialities = UsersSpeciality.all
    end

    @arrUsers_specialities = @users_specialities.to_a


    @markers = @users_specialities.map do |f|
      {
        lng: f.user.longitude,
        lat: f.user.latitude
      }

    end

    # STEP 4
  end

  private

  def params_user
    params.require(:user).permit(:username, :city, :address, :latitude, :longitude, :photo, :first_name, :last_name, :phone_number)
  end
end
