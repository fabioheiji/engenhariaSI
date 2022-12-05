require 'rails_helper'

RSpec.describe "matches/index.html.erb", type: :view do
  before(:each) do
    @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
    
    assign(:matches, [
      Match.create(name: 'Ibirapuera', description: 'Description0', address: 'USP Leste', level: 'Iniciante', starts_at: Time.now + 10, limit: 15, user: @user),
      Match.create(name: 'Rachão do IME', description: 'Description2', address: 'Cidade Universitária', level: 'Iniciante', halfCourt: 0, starts_at:  Time.now + 10000, limit: 4, user: @user)
    ])
  end

  it "display matches correctly" do
    render
    expect(rendered).to include("Buscar partida")
    expect(rendered).to include("Ibirapuera")
    expect(rendered).to include("Rachão do IME")
  end

  it "should not display matches" do
    assign(:matches, [])
    render
    expect(rendered).to include("Não há partidas criadas")
  end
end
