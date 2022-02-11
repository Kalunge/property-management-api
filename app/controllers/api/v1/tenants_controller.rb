class Api::V1::TenantsController < ApplicationController
  before_action :set_tenant, only: %i[show update destroy]

  # GET /tenants
  def index
    @tenants = Tenant.all

    render json: TenantsRepresenter.new(@tenants).as_json
  end

  # GET /tenants/1
  def show
    render json: TenantRepresenter.new(@tenant).as_json
  end

  # POST /tenants
  def create
    @tenant = Tenant.new(tenant_params)

    if @tenant.save
      render json: TenantsRepresenter.new(@tenants).as_json, status: :created
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
    params.require(:tenant).permit(:name, :email, :phone, :deposit)
  end
end
