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

  it 'invalido limite acima do maximo' do
    match = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre", starts_at: '2022-11-05T15:00', limit: 25)
    expect(match).not_to be_valid
  end

  it 'invalido limite abaixo do minimo' do
    match = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre", starts_at: '2022-11-05T15:00', limit: 1)
    expect(match).not_to be_valid
  end

  it 'realiza pesquisa' do
    match = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre", starts_at: '2022-11-05T15:00', limit: 15)
    match = Match.search("EACH")
    expect(match).to exist
  end

  it 'retorna todas as partidas' do
    match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre", limit: 15) 
    match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: "Livre", limit: 15)
    match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'USP São Carlos', level: "Livre", limit: 15)
    
    results = Match.search(nil)
    matches = Match.all

    expect(results).to eq(matches)
  end
end
