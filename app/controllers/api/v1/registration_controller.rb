module Api
  module V1
    class RegistrationController < Api::V1::BaseController
    	skip_before_action :authenticate_request

      # /api/v1/signup
      def create
        success = false
        if params[:email].present? && params[:password].present? && params[:first_name].present? && params[:phone_number].present?
          user = User.new(user_params)
          user.skip_confirmation!
          if user.save
            success = true
            message = 'User successfully registered and confirmed'
          end
        end
        if success
          render json: { success:, message:, user: UserSerializer.new(user).serializable_hash },
                 status: 200
        else
          render json: { success:, message: user.errors.full_messages.compact * ' and ' },
                 status: 422
        end
      end

      private

      def user_params
        params.permit(:email, :password, :first_name, :last_name, :phone_number, :company_type)
      end
    end
  end
end
