class CountriesController < ApplicationController
  before_action :set_country, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user_or_vendor!

  # GET /countries or /countries.json
  def index
    @countries = Country.all
  end

  # GET /countries/1 or /countries/1.json
  def show
  end

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries or /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to country_url(@country), notice: "Country was successfully created." }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1 or /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to country_url(@country), notice: "Country was successfully updated." }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1 or /countries/1.json
  def destroy
    if @country.cities.any?
      redirect_to countries_url, alert: "Couldn't delete #{@country.name} as there are cities associated with this country"
    else
      @country.destroy!
      respond_to do |format|
        format.html { redirect_to countries_url, notice: "Country was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  rescue StandardError => e
    redirect_to cities_url, alert: "An error occurred while trying to delete the city."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_params
      params.require(:country).permit(:name)
    end
end
