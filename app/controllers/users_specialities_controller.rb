class UsersSpecialitiesController < ApplicationController
  before_action :set_users_speciality, only: [:show, :edit, :update, :destroy]

  # GET /users_specialities
  # GET /users_specialities.json
  def index
    @users_specialities = policy_scope(UsersSpeciality).where(user: current_user)
  end

  # GET /users_specialities/1
  # GET /users_specialities/1.json
  def show
    authorize @users_speciality
  end

  # GET /users_specialities/new
  def new
    @users_speciality = UsersSpeciality.new
    authorize @users_speciality
  end

  # GET /users_specialities/1/edit
  def edit
  authorize @users_speciality
  end

  # POST /users_specialities
  # POST /users_specialities.json
  def create
    @users_speciality = UsersSpeciality.new(users_speciality_params)
    @users_speciality.user = current_user
    authorize @users_speciality
    respond_to do |format|
      if @users_speciality.save
        format.html { redirect_to @users_speciality, notice: 'Users speciality was successfully created.' }
        format.json { render :show, status: :created, location: @users_speciality }
      else
        format.html { render :new }
        format.json { render json: @users_speciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_specialities/1
  # PATCH/PUT /users_specialities/1.json
  def update
    authorize @users_speciality
    respond_to do |format|
      if @users_speciality.update(users_speciality_params)
        format.html { redirect_to @users_speciality, notice: 'Users speciality was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_speciality }
      else
        format.html { render :edit }
        format.json { render json: @users_speciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_specialities/1
  # DELETE /users_specialities/1.json
  def destroy
    authorize @users_speciality
    @users_speciality.destroy
    respond_to do |format|
      format.html { redirect_to users_specialities_url, notice: 'Users speciality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_speciality
      @users_speciality = UsersSpeciality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_speciality_params
      params.require(:users_speciality).permit(:description, :avg_punctuation, :avg_punctuation, :avg_efficacy, :avg_efficacy, :avg_behaviour, :avg_behaviour, :user_id, :speciality_id)
    end
end
