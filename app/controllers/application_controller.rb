class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthApiRequest.call(request.headers).result

      tokenite = request.authorization

    puts "\n\n**********************\n\n" + tokenite.to_s + "\n\n**********************\n\n"
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
