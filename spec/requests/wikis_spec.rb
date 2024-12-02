require 'rails_helper'

RSpec.describe "Wikis", type: :request do
  let(:user) { create(:user) }
  let(:headers) { { 'Authorization' => "Bearer #{user.jwt}" } } # Adjust as needed for JWT

  describe "GET /wikis" do
    it "returns all wikis" do
      get wikis_path, headers: headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /wikis" do
    post wikis_path
  end
  # Add more tests for create, update, and delete
end