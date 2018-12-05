class SpecialitiesController < ApplicationController
  before_action :set_speciality, only: [:show, :edit, :update, :destroy]

  # GET /specialities
  # GET /specialities.json
  def index
    @specialities = policy_scope(Speciality)
  end

  # GET /specialities/1
  # GET /specialities/1.json
  def show
  end

  # GET /specialities/new
  def new
    @speciality = Speciality.new
    authorize @speciality

  end

  # GET /specialities/1/edit
  def edit
  end

  # POST /specialities
  # POST /specialities.json
  def create
    @speciality = Speciality.new(speciality_params)
    authorize @speciality
    respond_to do |format|
      if @speciality.save
        format.html { redirect_to @speciality, notice: 'Speciality was successfully created.' }
        format.json { render :show, status: :created, location: @speciality }
      else
        format.html { render :new }
        format.json { render json: @speciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialities/1
  # PATCH/PUT /specialities/1.json
  def update
    respond_to do |format|
      if @speciality.update(speciality_params)
        format.html { redirect_to @speciality, notice: 'Speciality was successfully updated.' }
        format.json { render :show, status: :ok, location: @speciality }
      else
        format.html { render :edit }
        format.json { render json: @speciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialities/1
  # DELETE /specialities/1.json
  def destroy
    @speciality.destroy
    respond_to do |format|
      format.html { redirect_to specialities_url, notice: 'Speciality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speciality
      @speciality = Speciality.find(params[:id])
      authorize @speciality
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def speciality_params
      params.require(:speciality).permit(:name, :description)
    end
end
