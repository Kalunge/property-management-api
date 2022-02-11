class Api::V1::BlocksController < ApplicationController
  before_action :set_block, only: %i[show update destroy]

  # GET /blocks
  def index
    @blocks = Block.all

    render json: BlocksRepresenter.new(@blocks).as_json
  end

  # GET /blocks/1
  def show
    render json: BlockRepresenter.new(@block).as_json
  end

  # POST /blocks
  def create
    @block = Block.new(block_params)

    if @block.save
      render json: @block, status: :created
    else
      render json: @block.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blocks/1
  def update
    if @block.update(block_params)
      render json: @block
    else
      render json: @block.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blocks/1
  def destroy
    @block.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_block
    @block = Block.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def block_params
    params.require(:block).permit(:name, :location, :user_id)
  end
end
