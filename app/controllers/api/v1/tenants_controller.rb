class Api::V1::TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :update, :destroy]

  # GET /tenants
  def index
    @tenants = Tenant.all

    render json: @tenants
  end

  # GET /tenants/1
  def show
    render json: @tenant
  end

  # POST /tenants
  def create
    @tenant = Tenant.new(tenant_params)

    if @tenant.save
      render json: @tenant, status: :created, location: @tenant
    else
      render json: @tenant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tenants/1
  def update
    if @tenant.update(tenant_params)
      render json: @tenant
    else
      render json: @tenant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tenants/1
  def destroy
    @tenant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tenant_params
      params.fetch(:tenant, {})
    end
end
