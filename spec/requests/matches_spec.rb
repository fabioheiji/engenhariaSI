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
      post matches_path, params: { match: { name: "Big hash", description: "Hello! Join in match", address: "Atlanta", privateCourt: true, halfCourt: false, limit: 15, level: "Livre", starts_at: Time.now + 10 } }
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
      @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 10, user: @user, privateCourt: true, halfCourt: true, level: "livre")
      get "/matches/#{@match.id}"
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST create_participate_in_match" do
    before(:each) do
      matchOwner = User.create(name: "Cleber", email: "cleber@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      post login_path, params: { session: { email: "john@email.com", password: "123" } }          
      @match = Match.create(name: "Big hash", description: "Hello! Join in match", address: "Atlanta", privateCourt: true, halfCourt: false, limit: "8", level: "Beginner", starts_at: Time.now + 10, user: matchOwner)
    end
    
    it "returns http redirect" do
      get "/matches/#{@match.id}"
      # post create_participate_in_match_path, params: { participate_in_match: {}}
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id}}
      expect(response).to have_http_status(:redirect)
    end
    
    it "should remove the user from a match" do
      get "/matches/#{@match.id}"
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id}}
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id}, commit: "Sair da Partida"}
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "DELETE /match/:id with success" do
    it "deletes an existing match successfully" do
      user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")

      match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 10, user: user, privateCourt: true, halfCourt: true, starts_at: Time.now + 10, level: "livre")
      post login_path, params: { session: { email: "john@email.com", password: "123" } }    

      delete "/matches/#{match.id}"

      expect { Match.find(match.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "DELETE /match/:id failed without authorization" do
    it "deletes an existing match unsuccessfully" do
      user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")

      match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 10, user: user, privateCourt: true, halfCourt: true, starts_at: Time.now + 10, level: "livre")    

      delete "/matches/#{match.id}"

      expect(Match.find(match.id)).to eq(match)
    end
  end
end
