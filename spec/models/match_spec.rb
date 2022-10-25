require 'rails_helper'

RSpec.describe Match, type: :model do

  before 'é válido com atributos válidos' do
    user = User.new(
      name: 'LeBron James', 
      email: 'lebron@james.com', 
      password: 'notmynameorbirthdateforsure', 
      password_confirmation: '123456',
      birth_date: Date.new(1984, 12, 30),
      position: 'Power Forward'
    )
    user.save

    @match = Match.new(
      name: 'Rachão LeEACH',
      description: 'Partida legendária',
      address: 'USP Leste',
      level: "To infinity and beyond",
      user: user
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
    expect(match).not_to be_valid   match = Match.new
  end

  it 'é válido com atributos válidos' do
    expect(@match).to be_valid
  end

  it 'realiza pesquisa' do
    match = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Beginner")
    match = Match.search("EACH")
    expect(match).to exist
  end

  it 'retorna todas as partidas' do
    match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Beginner") 
    match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: "Beginner")
    match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'USP São Carlos', level: "Beginner")
    
    results = Match.search(nil)
    matches = Match.all

    expect(results).to eq(matches)
  end
end
