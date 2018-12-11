class InterventionsController < ApplicationController
  before_action :set_intervention, only: [:show, :edit, :update, :destroy]

  # GET /interventions
  # GET /interventions.json
  def index
    @interventions = policy_scope(Intervention)
  end

  # GET /interventions/1
  # GET /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @users_speciality = UsersSpeciality.find(params[:users_speciality_id])
    @intervention = Intervention.new
    authorize @intervention
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions
  # POST /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
    @intervention.users_speciality = UsersSpeciality.find(params[:users_speciality_id])
    @intervention.user = current_user
    authorize @intervention
    respond_to do |format|
      if @intervention.save
        format.html { redirect_to user_profile_show_path(@intervention.users_speciality.user_id), notice: 'Intervention was successfully created.' }
        format.json { render :show, status: :created, location: user_profile_show_path(@intervention.users_speciality.user_id) }
      else
        format.html { render :new }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1
  # PATCH/PUT /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: 'Intervention was successfully updated.' }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1
  # DELETE /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: 'Intervention was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
      authorize @intervention
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intervention_params
      params.require(:intervention).permit(:status, :date_intervention, :user_id, :users_speciality_id)
    end
end
