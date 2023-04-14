require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Login' do
  include Rails.application.routes.url_helpers

  before do
    @user = FactoryBot.create(:user)
  end

  post '/api/v1/login' do
    parameter :email, required: true, type: :email
    parameter :password, required: true, type: :string

    example 'Login' do
      explanation 'Returns an auth_token. would be valid for 24 hours'
      request = { email: @user.email, password: @user.password }
      do_request(request)
      expect(status).to eq(200)
    end
  end
end
