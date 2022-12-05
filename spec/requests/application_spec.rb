require 'rails_helper'

RSpec.describe "Application", type: :request do
  describe "GET /inexistent-path" do
    it "returns http not found" do
      expect { get "/inexistent-path" }.to raise_error(ActionController::RoutingError)
    end
  end

  describe "GET /matches" do
    it "returns http redirect - user not logged in" do
      get "/matches"
      expect(response).to have_http_status(:redirect)
    end

    it "returns http success" do
      @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      post login_path, params: { session: { email: "john@email.com", password: "123" } }          
      get "/matches"
      expect(response).to have_http_status(:success)
    end
  end
end
