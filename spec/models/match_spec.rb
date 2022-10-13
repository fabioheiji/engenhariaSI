require 'rails_helper'

RSpec.describe Match, type: :model do
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
