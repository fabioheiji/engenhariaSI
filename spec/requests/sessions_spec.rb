require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /login" do
    before :each do
      @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
    end

    it "should login successfully" do
      post login_path, params: { session: { email: "john@email.com", password: "123" } }
      expect(session[:user_id]).to eql(@user.id)
      expect(response).to redirect_to(matches_path)
    end

    it "should not login - incorrect email or password" do
      post login_path, params: { session: { email: "john@email.com", password: "12345" } }
      expect(session[:user_id]).to be_nil
    end
  end

  describe "DELETE /logout" do
    it "should logout successfully" do
      @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")

      post login_path, params: { session: { email: "john@email.com", password: "123" } }
      expect(session[:user_id]).to eql(@user.id)
      
      delete logout_path
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end
end
