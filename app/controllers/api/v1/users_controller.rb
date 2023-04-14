module Api
  module V1
    class UsersController < Api::V1::BaseController
    	def connection_requests
        render json: current_user.recieve_requests
      end

    	def send_request
    		reciever = User.find_by(id: params[:reciever_id])
    		if reciever.present?
    			sender = current_user.supplier? ? 'supplier' : 'restaurant'
    			connection_request = ConnectionRequest.create(sender_id: current_user.id, reciever_id: reciever.id, send_by: sender)
          render json: { success: true, message: 'Connection request send' }, status: 200
        else
          render json: { success: false, message: 'Reciever not found' }, status: 404
        end
    	end

    	def accept_request
        connection_request = ConnectionRequest.find_by(id: params[:request_id])
        if connection_request.present?
          connection_request.update(status: :accepted)
          render json: { success: true, message: 'Connection request accepted' }, status: 200
        else
          render json: { success: false, message: 'Connection request not found' }, status: 404
        end
    	end

      def decline_request
        connection_request = ConnectionRequest.find_by(id: params[:request_id])
        if connection_request.present?
          connection_request.destroy
          render json: { success: true, message: 'Connection request declined' }, status: 200
        else
          render json: { success: false, message: 'Connection request not found' }, status: 404
        end
      end
    end
  end
end
