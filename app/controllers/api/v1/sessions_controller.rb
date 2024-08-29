class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]
  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])
      sign_in user
      render json: { token: user.authentication_token, user: user }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end
