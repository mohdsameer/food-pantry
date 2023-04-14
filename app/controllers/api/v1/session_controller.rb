module Api
  module V1
    class SessionController < Api::V1::BaseController
    	skip_before_action :authenticate_request

    	# /api/v1/login
      def create
      	command = AuthenticateUser.call(params[:email], params[:password])
        if command.success?
          user = User.find_by(id: JsonWebToken.decode(command.result)[:user_id])
          render json: { success: true, user: user, auth_token: command.result }, status: 200
        else
          render json: { success: false, error: command.errors.values.flatten.join(', ') }, status: 422
        end
      end
    end
  end
end
