require 'rails_helper'

RSpec.describe "matches/edit.html.erb", type: :view do
  it "display edit match form correctly" do
    @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
    @current_match = Match.create(name: 'Ibirapuera', description: 'Description0', address: 'USP Leste', level: 'Iniciante', starts_at: Time.now + 10, limit: 15, user: @user)
    render
    expect(render).to include("Editar partida")
    expect(rendered).to include("Nome")
    expect(rendered).to include("Ibirapuera")
    expect(rendered).to include("Descrição")
    expect(rendered).to include("Endereço")
    expect(rendered).to include("Limite de participantes")
    expect(rendered).to include("Nível")
    expect(rendered).to include("Inicia-se")
    expect(rendered).to include("Quadra privada")
    expect(rendered).to include("Meia quadra")
    expect(rendered).to include("Salvar")
  end
end
