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

  describe "DELETE /matches/:id" do
    before(:each) do
      @user_match_owner = User.create(name: "Cleber", email: "cleber@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      @user_not_match_owner = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 10, user: @user_match_owner, privateCourt: true, halfCourt: true, starts_at: Time.now + 10, level: "livre")
    end

    it "deletes an existing match that user is owner" do
      post login_path, params: { session: { email: @user_match_owner.email, password: @user_match_owner.password } }          
      delete "/matches/#{@match.id}"
      expect(response).to have_http_status(:see_other)
      expect { Match.find(@match.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "does not deletes an existing match - user is not owner" do
      post login_path, params: { session: { email: @user_not_match_owner.email, password: @user_not_match_owner.password } }          
      delete "/matches/#{@match.id}"
      expect(response).to have_http_status(:forbidden)
      expect(Match.find(@match.id)).to eq(@match)
    end
  end

  describe "GET /matches/:id/edit" do
    before(:each) do
      @user_match_owner = User.create(name: "Cleber", email: "cleber@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      @user_not_match_owner = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 10, user: @user_match_owner, privateCourt: true, halfCourt: true, starts_at: Time.now + 10, level: "livre")
    end

    it "visits edit match page that user is owner" do
      post login_path, params: { session: { email: @user_match_owner.email, password: @user_match_owner.password } }          
      get "/matches/#{@match.id}/edit"
      expect(response).to have_http_status(:success)
    end

    it "does not visits edit match page that user is not owner" do
      post login_path, params: { session: { email: @user_not_match_owner.email, password: @user_not_match_owner.password } }          
      get "/matches/#{@match.id}/edit"
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "PUT /matches/:id" do
    before(:each) do
      @user_match_owner = User.create(name: "Cleber", email: "cleber@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      @user_not_match_owner = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 10, user: @user_match_owner, privateCourt: true, halfCourt: true, starts_at: Time.now + 10, level: "livre")
    end

    it "update match that user is owner" do
      post login_path, params: { session: { email: @user_match_owner.email, password: @user_match_owner.password } }          
      put "/matches/#{@match.id}", params: { match: { name: "Big hash", description: "Hello! Join in match", address: "Atlanta", privateCourt: true, halfCourt: false, limit: 15, level: "Livre", starts_at: Time.now + 10 } }
      expect(response).to have_http_status(:no_content)
    end

    it "does not update match that user is not owner" do
      post login_path, params: { session: { email: @user_not_match_owner.email, password: @user_not_match_owner.password } }          
      put "/matches/#{@match.id}", params: { match: { name: "Big hash", description: "Hello! Join in match", address: "Atlanta", privateCourt: true, halfCourt: false, limit: 15, level: "Livre", starts_at: Time.now + 10 } }
      expect(response).to have_http_status(:forbidden)
    end
    it "does not update match without params" do
      post login_path, params: { session: { email: @user_match_owner.email, password: @user_match_owner.password } }          
      expect { put "/matches/#{@match.id}" }.to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "POST create_participate_in_match privateMatch" do
    before(:each) do
      @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
      post login_path, params: { session: { email: "john@email.com", password: "123" } }          
      @match = Match.create(name: "Rachao da EACH 2", description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", privateCourt: true, limit: 20, halfCourt: true, level: "Livre", starts_at: "2022-10-30T09:00", privateMatch: true, privateMatchPassword: "12345")
    end
    
    it "returns http redirect" do
      get "/matches/#{@match.id}"
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id, privateMatchPassword: @match.privateMatchPassword}}
      expect(response).to have_http_status(:redirect)
    end

    it "returns message error with wrong password" do
      get "/matches/#{@match.id}"
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id, privateMatchPassword: "1111"}}
      expect(response).to have_http_status(422)
    end

    it "returns message error with password in blank" do
      get "/matches/#{@match.id}"
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id, privateMatchPassword: ""}}
      expect(response).to have_http_status(422)
    end
    
    it "should remove the user from a private match" do
      get "/matches/#{@match.id}"
      post create_participate_in_match_path, params: {participate_in_match: {user_id: @user.id, match_id: @match.id, privateMatchPassword: @match.privateMatchPassword}, commit: "Sair da Partida"}
      expect(response).to have_http_status(:redirect)
    end

  end  
end
