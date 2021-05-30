class ApplicationController < ActionController::API
  attr_reader :current_user

  def authenticate_request
    @current_user = AuthApiRequest.call(request.headers).result

      #tokenite = request.authorization.to_s
      tokenite = request.headers['Authorization'].split(' ').last.to_s

    puts "\n\n**********************\n\n" + tokenite + "\n\n**********************\n\n"
    render json: { error: "Not Authorized #{tokenite}" }, status: 401 unless @current_user
  end
end
