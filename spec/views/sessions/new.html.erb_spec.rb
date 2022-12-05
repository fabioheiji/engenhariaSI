require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
  it "display login correctly" do
    render
    expect(rendered).to include("Email")
    expect(rendered).to include("Senha")
    expect(rendered).to include("Confirmar")
    expect(rendered).to include("Registre-se aqui")
  end
end
