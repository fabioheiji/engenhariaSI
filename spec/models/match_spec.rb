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
end