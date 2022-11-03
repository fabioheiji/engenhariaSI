require 'rails_helper'

RSpec.describe Match, type: :model do
  context 'before user click participar' do
    it 'cannot have participants listed' do
        match = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre") 
        user = User.new(
            name: 'Usuário Fake', 
            email: 'usuario@mail.com', 
            password: '123456', 
            password_confirmation: '123456',
            birth_date: Date.new(2000, 07, 15),
            position: 'Power Forward'
        )
        expect(match.users.length()).to eq(0)
    end
  end
  context 'after user click participar' do
    it 'the name of the user should be listed in first position if the list was empty' do
        match = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre") 
        user = User.new(
            name: 'Usuário Fake', 
            email: 'usuario@mail.com', 
            password: '123456', 
            password_confirmation: '123456',
            birth_date: Date.new(2000, 07, 15),
            position: 'Power Forward'
        )
        match.users << user
        expect(match.users.first).to eq(user)
    end
    it 'the name of the user should be listed in last position if it was the last to join the match' do
        match = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Livre") 
        user1 = User.new(
            name: 'Usuário Fake 1', 
            email: 'usuario1@mail.com', 
            password: '123456', 
            password_confirmation: '123456',
            birth_date: Date.new(2000, 07, 15),
            position: 'Power Forward'
        )
        user2 = User.new(
            name: 'Usuário Fake 2', 
            email: 'usuario2@mail.com', 
            password: '123456', 
            password_confirmation: '123456',
            birth_date: Date.new(2000, 07, 15),
            position: 'Power Forward'
        )
        match.users << user1
        match.users << user2
        expect(match.users.first).to eq(user1)
        expect(match.users.last).to eq(user2)
    end
    it 'it should be possible to search for all the matches that the user has joined and vice versa' do
        match0 = Match.create(name: 'Rachão da EACH0', description: 'Description0', address: 'USP Leste', level: "Livre") 
        match1 = Match.create(name: 'Rachão da EACH1', description: 'Description1', address: 'USP Leste', level: "Livre") 
        user1 = User.new(
            name: 'Usuário Fake 1', 
            email: 'usuario1@mail.com', 
            password: '123456', 
            password_confirmation: '123456',
            birth_date: Date.new(2000, 07, 15),
            position: 'Power Forward'
        )
        user2 = User.new(
            name: 'Usuário Fake 2', 
            email: 'usuario2@mail.com', 
            password: '123456', 
            password_confirmation: '123456',
            birth_date: Date.new(2000, 07, 15),
            position: 'Power Forward'
        )
        match0.users << user1
        match0.users << user2
        match1.users << user1
        match1.users << user2
        expect(match0.users).to eq([user1,user2])
        expect(match1.users).to eq([user1,user2])
        expect(user1.matches).to eq([match0,match1])
        expect(user2.matches).to eq([match0,match1])
    end
  end

end
