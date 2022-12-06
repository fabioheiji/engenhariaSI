require 'rails_helper'

RSpec.describe "matches/new.html.erb", type: :view do
  it "display new match form correctly" do
    @match = Match.new
    render
    expect(rendered).to include("Nome")
    expect(rendered).to include("Descrição")
    expect(rendered).to include("Endereço")
    expect(rendered).to include("Limite de participantes")
    expect(rendered).to include("Nível")
    expect(rendered).to include("Inicia-se")
    expect(rendered).to include("Quadra privada")
    expect(rendered).to include("Meia quadra")
    expect(rendered).to include("Partida privada")
    expect(rendered).to include("Senha para partida privada")
    expect(rendered).to include("Salvar")
  end
end
