class Api::V1::AuthenticateController < ApplicationController
  class AuthenticationError < StandardError; end
  rescue_from ActionController::ParameterMissing, with: :param_missing
  rescue_from AuthenticationError, with: :handle_unauthenticated
  def create
    raise AuthenticationError unless user.authenticate(params.require(:password))

    token = AuthenticationTokenService.encode(user.id)

    render json: { token: token }, status: :created
  end

  private

  def user
    @user ||= User.find_by(name: params.require(:name))
  end

  def param_missing
    render json: { errors: 'param is missing or the value is empty: username/password' }, status: :unprocessable_entity
  end

  def handle_unauthenticated
    render json: { errors: 'Wrong Email or password' }, status: :unprocessable_entity
  end
end
