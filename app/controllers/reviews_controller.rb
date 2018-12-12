class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @users_speciality = UsersSpeciality.find(params[:users_speciality_id])
    @reviews = policy_scope(Review).where(users_speciality: @users_speciality).order(created_at: :desc)
    @review = Review.new
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    set_review
  end

  # GET /reviews/new
  def new
    @users_speciality = UsersSpeciality.find(params[:users_speciality_id])
    @review = Review.new
    authorize @review
  end

  # GET /reviews/1/edit
  def edit
    @users_speciality = UsersSpeciality.find(params[:users_speciality_id])
    set_review
    authorize @review
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.users_speciality = UsersSpeciality.find(params[:users_speciality_id])
    @review.user = current_user
    authorize @review
    respond_to do |format|
      if @review.save
        average_review
        format.html { redirect_to user_profile_show_path(@review.users_speciality.user_id), notice: 'Review was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    authorize @review
    respond_to do |format|
      if @review.update(review_params)
        average_review
        format.html { redirect_to user_profile_show_path(@review.users_speciality.user_id), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    authorize @review
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:puntctuation, :efficacy, :behaviour, :commentary, :user_id, :users_speciality_id)
    end

    def average_review
      users_speciality = @review.users_speciality
      users_speciality.avg_punctuation = Review.where(users_speciality: users_speciality).average(:puntctuation)
      users_speciality.avg_efficacy = Review.where(users_speciality: users_speciality).average(:efficacy)
      users_speciality.avg_behaviour = Review.where(users_speciality: users_speciality).average(:behaviour)
      users_speciality.save
    end
end
