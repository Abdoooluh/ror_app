class CitiesController < ApplicationController
  before_action :set_city, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user_or_vendor!


  # GET /cities or /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1 or /cities/1.json
  def show
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities or /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to city_url(@city), notice: "City was successfully created." }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1 or /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to city_url(@city), notice: "City was successfully updated." }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1 or /cities/1.json
  def destroy
    if @city.users.any?
      redirect_to cities_url, alert: "City cannot be deleted because there are users registered to it."
    else
      # Otherwise, delete the city
      @city.destroy!

      respond_to do |format|
        format.html { redirect_to cities_url, notice: "City was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  rescue StandardError => e
    redirect_to cities_url, alert: "An error occurred while trying to delete the city."
  end

  def getCityDetails
    if params[:country_id]
      cities = City.where(country_id: params[:country_id])
      render json: cities
    else
      render json: []
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_params
      params.require(:city).permit(:name, :country_id)
    end
end
