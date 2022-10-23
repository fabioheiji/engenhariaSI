require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /signup" do
    it "should create user account" do
      post signup_path, params: { user: { name: "John", email: "john@email.com", password: "12345", password_confirmation: "12345", birth_date: "01/01/2001", position: "PF" } }
      expect(response).to redirect_to(login_path)
    end 

    it "should not create user account" do
      post signup_path, params: { user: { name: "John" } }
      expect(response).not_to redirect_to(login_path)
    end
  end
end
