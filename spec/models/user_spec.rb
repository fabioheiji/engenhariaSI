require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it 'invalido sem nome' do
    user = User.new
    user.email = 'Wallaceramonns@usp.br'
    user.password = '123456'
    user.password_confirmation = '123456'
    user.birth_date = Date.new(1999, 10, 14)
    user.position = 'Power Forward'
    expect(user).not_to be_valid
  end
  
  it 'invalido sem email' do
    user = User.new
    user.name = 'Wallace Ramon'
    user.password = '123456'
    user.password_confirmation = '123456'
    user.birth_date = Date.new(1999, 10, 14)
    user.position = 'Power Forward'
    expect(user).not_to be_valid
  end

  it 'invalido sem password' do
    user = User.new
    user.name = 'Wallace Ramon'
    user.email = 'Wallaceramonns@usp.br'
    user.password_confirmation = '123456'
    user.birth_date = Date.new(1999, 10, 14)
    user.position = 'Power Forward'
    expect(user).not_to be_valid
  end

  it 'invalido sem password confirmation' do
    user = User.new
    user.name = 'Wallace Ramon'
    user.email = 'Wallaceramonns@usp.br'
    user.password_confirmation = '123456'
    user.birth_date = Date.new(1999, 10, 14)
    user.position = 'Power Forward'
    expect(user).not_to be_valid
  end

  it 'invalido sem birth date' do
    user = User.new
    user.name = 'Wallace Ramon'
    user.email = 'Wallaceramonns@usp.br'
    user.password = '123456'
    user.password_confirmation = '123456'
    user.position = 'Power Forward'
    expect(user).not_to be_valid
  end

  it 'invalido com email com formato nao suportado' do
    user = User.new
    user.name = 'Wallace Ramon'
    user.email = ',,@gmail.com'
    user.password = '123456'
    user.password_confirmation = '123456'
    user.birth_date = Date.new(1999, 10, 14)
    user.position = 'Power Forward' 
    expect(user).not_to be_valid
  end

  it 'invalido com email já existente na base de dados' do
    user = User.new(
        name: 'Usuário 1', 
        email: 'usuario@mail.com', 
        password: '123456', 
        password_confirmation: '123456',
        birth_date: Date.new(1998, 02, 20),
        position: 'Power Forward'
    )
    user.save

    user2 = User.new(
        name: 'Usuário 2', 
        email: 'usuario@mail.com', 
        password: '123456', 
        password_confirmation: '123456',
        birth_date: Date.new(2000, 07, 15),
        position: 'Power Forward'
    )

    expect(user2.save).to be_falsey
  end
end
