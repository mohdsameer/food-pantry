require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Registration' do
  include Rails.application.routes.url_helpers

  post '/api/v1/signup' do
    parameter :email, required: true, type: :email
    parameter :password, required: true, type: :string
    parameter :first_name, required: true, type: :string
    parameter :last_name, type: :string
    parameter :phone_number, required: true, type: :string
    parameter :company_type, required: true, type: :string, enum: { supplier: 0, restaurant: 1 }

    example 'Signup' do
      request = { email: 'mohd@example.com', password: 'test@123', first_name: 'Mohd', last_name: 'Roi',
                  phone_number: '0987654321' }
      do_request(request)
      expect(status).to eq(200)
    end
  end
end
