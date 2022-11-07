Given('I open the matches page') do
    user = User.create(name: 'LeBron James', email: 'lebron@james.com', password: '123456', password_confirmation: '123456', birth_date: Date.new(1984, 12, 30), position: 'Power Forward')
    
    @match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: 'Livre', starts_at: '2022-11-05T15:00', limit: 15, user: user)
    @match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: 'Livre', starts_at: '2022-11-05T15:00', limit: 15, user: user)
    @match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'USP São Carlos', level: 'Livre', starts_at: '2022-11-05T15:00', limit: 15, user: user)

    visit '/matches'
end

Then('I should see all matches') do
    expect(page).to have_content('Rachão da EACH')
    expect(page).to have_content('Rachão do ICMC')
    expect(page).to have_content('Rachão do IME')
end
