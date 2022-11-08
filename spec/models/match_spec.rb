require 'rails_helper'

RSpec.describe Match, type: :model do

  before(:each) do
    @user = User.create( 
      name: 'LeBron James', 
      email: 'lebron@james.com', 
      password: '123456', 
      password_confirmation: '123456',
      birth_date: Date.new(1984, 12, 30),
      position: 'Power Forward'
    )
  end

  it 'invalido sem nome' do
    match = Match.new
    match.name = ""
    expect(match).not_to be_valid
  end

  it 'invalido sem descricao' do
    match = Match.new
    match.description = ""
    expect(match).not_to be_valid
  end

  it 'invalido sem endereco' do
    match = Match.new
    match.address = ""
    expect(match).not_to be_valid
  end

  it 'invalido sem nivel' do
    match = Match.new
    match.level = ""
    expect(match).not_to be_valid
  end

  it 'não é válido sem criador' do
    match = Match.new
    match.user_id = nil
    expect(match).not_to be_valid
  end

  it 'é válido com atributos válidos' do
    match = Match.create(name: 'Rachão LeEACH', description: 'Partida legendária', address: 'USP Leste', level: "To infinity and beyond", user: @user, limit: 15, starts_at: '2022-11-05T15:00')
    expect(match).to be_valid
  end

  it 'invalido limite acima do maximo' do
    match = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre", starts_at: '2022-11-05T15:00', user: @user, limit: 25, starts_at: '2022-11-05T15:00')
    expect(match).not_to be_valid
  end

  it 'invalido limite abaixo do minimo' do
    match = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre", starts_at: '2022-11-05T15:00', user: @user, limit: 1, starts_at: '2022-11-05T15:00')
    expect(match).not_to be_valid
  end

  it 'realiza pesquisa' do
    match = Match.create(name: 'Rachão LeEACH', description: 'Partida legendária', address: 'USP Leste', level: "To infinity and beyond", user: @user, limit: 15, starts_at: '2022-11-05T15:00')
    match = Match.search("EACH")
    expect(match).to exist
  end

  it 'retorna todas as partidas' do
    match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre", limit: 15) 
    match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: "Livre", limit: 15)
    match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'USP São Carlos', level: "Livre", limit: 15)
    
    matches = Match.all
    results = Match.search(nil)

    expect(results).to all(be_valid)
    expect(results).to eq(matches)
  end
end
