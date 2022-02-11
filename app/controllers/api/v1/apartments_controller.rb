class Api::V1::ApartmentsController < ApplicationController
  before_action :set_apartment, only: %i[show update destroy]

  # GET /apartments
  def index
    @apartments = Apartment.all

    render json: ApartmentsRepresenter.new(@apartments).as_json
  end

  # GET /apartments/1
  def show
    render json: ApartmentRepresenter.new(@apartment).as_json
  end

  # POST /apartments
  def create
    @apartment = Apartment.new(apartment_params)

    if @apartment.save
      render json: ApartmentRepresenter.new(@apartment).as_json, status: :created
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /apartments/1
  def update
    if @apartment.update(apartment_params)
      render json: ApartmentRepresenter.new(@apartment).as_json
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /apartments/1
  def destroy
    @apartment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_apartment
    @apartment = Apartment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def apartment_params
    params.require(:apartment).permit(:name, :vacant, :block_id, :location, :rent)
  end
end
