require 'rails_helper'

RSpec.describe "matches/show.html.erb", type: :view do
  it "display show match correctly" do
    @user = User.create(name: "John", email: "john@email.com", birth_date: "01/01/1980", password_confirmation: "123", password: "123", position: "PF")
    @match = Match.create(name: 'Ibirapuera', description: 'Description0', address: 'USP Leste', level: 'Iniciante', starts_at: Time.now + 10, limit: 15, user: @user)
    render
    expect(rendered).to include("Ibirapuera")
    expect(rendered).to include("Description0")
    expect(rendered).to include("USP Leste")
    expect(rendered).to include("Iniciante")
  end
end
