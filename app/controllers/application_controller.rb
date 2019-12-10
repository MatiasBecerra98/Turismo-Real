class ApplicationController < ActionController::Base
  before_action :authenticate_request, except: [:check_in, :check_out]
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
