class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def create_user
    User.create!(email: params[:email] , password: params[:password] , password_confirmation: params[:password_confirmation] )
    render json: {status: "OK"}
  end
 end
