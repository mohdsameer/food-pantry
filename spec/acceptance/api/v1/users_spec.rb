require 'rails_helper'
require 'rspec_api_documentation/dsl'
resource 'User' do
  include Rails.application.routes.url_helpers

  before do
    @supplier = FactoryBot.create(:user, company_type: 0)
    @restaurant = FactoryBot.create(:user, company_type: 1)
    @res = AuthenticateUser.call(@supplier.email, @supplier.password)
    header 'Authorization', "Bearer #{@res.result}"
    @request = FactoryBot.create(:connection_request, sender_id: @restaurant.id, send_by: 'restaurant', reciever_id: @supplier.id)
  end

  get '/api/v1/requests' do
    example 'List all connection requests' do
      do_request
      expect(status).to eq(200)
    end
  end

  post '/api/v1/send_request' do
    parameter :reciever_id, type: :integer
    example 'Send connection request' do
      do_request(reciever_id: @restaurant.id)
      expect(status).to eq(200)
    end
  end

  patch '/api/v1/accept_request' do
    parameter :request_id, type: :integer
    example 'Accept connection request' do
      do_request(request_id: @request.id)
      expect(status).to eq(200)
    end
  end

  patch '/api/v1/decline_request' do
    parameter :request_id, type: :integer
    example 'Decline connection request' do
      do_request(request_id: @request.id)
      expect(status).to eq(200)
    end
  end
end
