require 'rails_helper'

RSpec.describe 'User Login', type: :request do
  let!(:user) { create(:user, email: 'user@example.com', password: 'password') }

  describe 'POST /login' do
    it 'returns a JWT token for valid credentials' do
      post '/login', params: { user: { email: 'user@example.com', password: 'password' } }, headers: { 'Content-Type': 'application/json' }
      
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response['token']).to be_present
    end

    it 'returns an error for invalid credentials' do
      post '/login', params: { user: { email: 'user@example.com', password: 'wrong_password' } }, headers: { 'Content-Type': 'application/json' }
      
      expect(response).to have_http_status(:unauthorized)
      json_response = JSON.parse(response.body)
      expect(json_response['error']).to eq('Invalid email or password')
    end
  end
end