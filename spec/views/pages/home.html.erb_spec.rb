require "spec_helper"

RSpec.describe "pages/home.html.erb", type: :view do
  it "displays matches correctly" do
    render
    expect(rendered).to include("Trabalho de Engenharia de Software")
    expect(rendered).to include("BigHash")
    expect(rendered).to include("Fábio Heiji Yamada	5690618")
    expect(rendered).to include("Vitor Martins Cruz	11845410")
    expect(rendered).to include("Matheus Aranha Lopes	11221219")
    expect(rendered).to include("Wallace Ramon Nogueira Soares 11847030")
    expect(rendered).to include("Thais Lasso Terense 10724222")
  end
end