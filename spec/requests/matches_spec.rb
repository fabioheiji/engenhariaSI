require 'rails_helper'

RSpec.describe "Matches", type: :request do
  describe "GET /matches" do
    before(:each) do
      @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      post login_path, params: { session: { email: "john@email.com", password: "123" } }    
    end

    it "returns http success" do
      get matches_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /matches" do
    before(:each) do
      @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      post login_path, params: { session: { email: "john@email.com", password: "123" } }    
    end

    it "should create match" do
      post matches_path, params: { match: { name: "Big hash", description: "Hello! Join in match", address: "Atlanta", privateCourt: true, halfCourt: false, limit: "8", level: "Beginner", starts_at: '2022-11-05T15:00' } }
      expect(response).to redirect_to(matches_path)
    end

    it "should not create match" do
      post matches_path, params: { match: { name: "Big hash" } }
      expect(response).not_to redirect_to(matches_path)
    end
  end

  describe "GET /matches/new" do
    before(:each) do
      @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      post login_path, params: { session: { email: "john@email.com", password: "123" } }    
    end

    it "returns http success" do
      @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      post login_path, params: { session: { email: "john@email.com", password: "123" } }

      get new_match_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /matches/:id" do
    before(:each) do
      @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      post login_path, params: { session: { email: "john@email.com", password: "123" } }    
    end

    it "returns http success" do
      @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: "10", privateCourt: true, halfCourt: true, level: "livre")
      get "/matches/#{@match.id}"
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST create_participate_in_match" do
    before(:each) do
      @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      post login_path, params: { session: { email: "john@email.com", password: "123" } }          
      @match = Match.create(name: "Big hash", description: "Hello! Join in match", address: "Atlanta", privateCourt: true, halfCourt: false, limit: "8", level: "Beginner", starts_at: '2022-11-05T15:00')
    end
    
    it "returns http redirect" do
      get "/matches/#{@match.id}"
      # post create_participate_in_match_path, params: { participate_in_match: {}}
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id}}
      expect(response).to have_http_status(:redirect)
    end
    
    it "should not redirect" do
      get "/matches/#{@match.id}"
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id}}
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id}}
      expect(response).not_to have_http_status(:redirect)
    end
    
    it "should remove the user from a match" do
      get "/matches/#{@match.id}"
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id}}
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id}, commit: "Sair da Partida"}
      expect(response).to have_http_status(:success)
    end

  end
end
