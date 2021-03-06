class Api::V1::UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token
  before_action :set_user, only: %i[show update destroy]
  before_action :authenticate_user, only: [:destroy]

  # GET /users
  def index
    users = User.all

    render json: UsersRepresenter.new(users).as_json
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserRepresenter.new(@user).as_json, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  rescue ActionController::ParameterMissing
    render json: { message: 'Do not leave blank fields' }, status: :bad_request
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: UserRepresenter.new(@user).as_json
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  def authenticate_user
    token, _options = token_and_options(request)
    user_id = AuthenticationTokenService.decode(token)
    User.find(user_id)
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render status: :unauthorized
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render status: :unauthorized
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
