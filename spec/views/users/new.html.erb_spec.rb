require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do
  it "display signup correctly" do
    @user = User.new
    render
    expect(rendered).to include("Cadastro")
    expect(rendered).to include("Email")
    expect(rendered).to include("Senha")
    expect(rendered).to include("Confirmação da senha")
    expect(rendered).to include("Data de nascimento")
    expect(rendered).to include("Posição do jogador")
    expect(rendered).to include("Salvar")
  end
end
