class Api::V1::AuthenticateController < ApplicationController
  def create
    token = AuthenticationTokenService.encode(user.id)

    render json: {token: token}, status: :created
  end


  private

   def user
    @user ||= User.find_by(name: params.require(:name))
  end

end