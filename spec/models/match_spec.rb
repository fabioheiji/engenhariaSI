require 'rails_helper'

RSpec.describe Match, type: :model do

  before(:all) do
    Geocoder.configure(:lookup => :test)

    Geocoder::Lookup::Test.set_default_stub(
      [
        {
          'coordinates'  => [-23.5506507, -46.6333824],
        }
      ]
    )

    Geocoder::Lookup::Test.add_stub(
      "USP Leste", [
        {
          'coordinates'  => [-23.4854987, -46.5005576],
        }
      ]
    )
  end

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

  it 'retorna partida com latitude e longitude, dado um endereço' do
    each = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: 'Livre', halfCourt: 0, starts_at: '2020-11-05T15:00', limit: 15, user: @user)
    expect(each.latitude).to eq(-23.4854987)
    expect(each.longitude).to eq(-46.5005576)    
  end

  it 'é válido com atributos válidos' do
    match = Match.create(name: 'Rachão LeEACH', description: 'Partida legendária', address: 'USP Leste', level: "To infinity and beyond", user: @user, limit: 15, starts_at: Time.now + 10)
    expect(match).to be_valid
  end

  it 'invalido limite acima do maximo' do
    match = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre", starts_at: Time.now, user: @user, limit: 25, starts_at: Time.now + 10)
    expect(match).not_to be_valid
  end

  it 'invalido limite abaixo do minimo' do
    match = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre", starts_at: Time.now + 10, user: @user, limit: 1, starts_at: Time.now + 10)
    expect(match).not_to be_valid
  end

  it 'realiza pesquisa' do
    match = Match.create(name: 'Rachão LeEACH', description: 'Partida legendária', address: 'USP Leste', level: "To infinity and beyond", user: @user, limit: 15, starts_at: Time.now + 10)
    match = Match.search("EACH")
    expect(match).to exist
  end

  it 'retorna todas as partidas' do
    match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: 'Livre', halfCourt: 0, starts_at: '2020-11-05T15:00', limit: 15, user: @user)
    match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: 'Iniciante', halfCourt: 1, starts_at: '2021-11-05T15:00', limit: 10, user: @user)
    match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'USP São Carlos', level: 'Iniciante', halfCourt: 0, starts_at: '2022-11-05T15:00', limit: 4, user: @user)
    
    matches = Match.all
    results = Match.search(nil)

    expect(results).to all(be_valid)
    expect(results).to eq(matches)
  end

  it 'filtra partidas por data e hora de inicio' do
    match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: 'Livre', halfCourt: 0, starts_at:  Time.now + 100, limit: 15, user: @user)
    match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: 'Iniciante', halfCourt: 1, starts_at:  Time.now + 1000, limit: 10, user: @user)
    match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'USP São Carlos', level: 'Iniciante', halfCourt: 0, starts_at:  Time.now + 10000, limit: 4, user: @user)

    matches = [match1, match2]
    result = Match.filter_by_starts_at(Time.now + 990)
    expect(result).to eq(matches)
  end

  it 'filtra partidas por limite de participantes' do
    match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: 'Livre', halfCourt: 0, starts_at:  Time.now + 100, limit: 15, user: @user)
    match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: 'Iniciante', halfCourt: 1, starts_at:  Time.now + 1000, limit: 10, user: @user)

    result = Match.filter_by_limit(15)
    expect(result).to eq([match0])
  end

  it 'filtra partidas por nível de difuculdade' do
    match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: 'Livre', halfCourt: 0, starts_at: Time.now + 100, limit: 15, user: @user)
    match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: 'Iniciante', halfCourt: 1, starts_at: Time.now + 1000, limit: 10, user: @user)

    result = Match.filter_by_level("Livre")
    expect(result).to eq([match0])
  end

  it 'filtra partidas que apenas são meia quadra' do
    match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: 'Livre', halfCourt: 0, starts_at: Time.now + 100, limit: 15, user: @user)
    match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: 'Iniciante', halfCourt: 1, starts_at: Time.now + 1000, limit: 10, user: @user)

    result = Match.filter_by_half_court(true)
    expect(result).to eq([match1])
  end

  it 'filtra partidas que apenas não são meia quadra' do
    match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: 'Livre', halfCourt: 0, starts_at: Time.now + 100, limit: 15, user: @user)
    match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: 'Iniciante', halfCourt: 1, starts_at: Time.now + 1000, limit: 10, user: @user)

    result = Match.filter_by_half_court(false)
    expect(result).to eq([match0])
   end 
   
  it 'invalido data de inicio menor que a data atual' do
    match = Match.create(name: 'Rachão LeEACH', description: 'Partida legendária', address: 'USP Leste', level: "To infinity and beyond", user: @user, limit: 15, starts_at: Time.now - 10)
    expect(match).not_to be_valid
  end

  it 'não é editável pois não o usuário não é dono' do
    not_owner = User.create( 
      name: 'Jojo', 
      email: 'josuke_higashikata@morioh.jp', 
      password: 'jojo', 
      password_confirmation: 'jojo',
      birth_date: Date.new(1984, 12, 30),
      position: 'Power Forward'
    )
    match = Match.create(name: 'Rachão LeEACH', description: 'Partida legendária', address: 'USP Leste', level: "To infinity and beyond", user: @user, limit: 15, starts_at: Time.now - 10)

    
  end
end
