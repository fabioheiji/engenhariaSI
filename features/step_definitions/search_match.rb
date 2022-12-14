Given('the user opens the matches page') do
    user = User.create(name: 'LeBron James', email: 'lebron@james.com', password: '123456', password_confirmation: '123456', birth_date: Date.new(1984, 12, 30), position: 'Power Forward')
    
    @match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: 'Livre', halfCourt: 0, starts_at: Time.now + 100, limit: 15, user: user)
    @match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'USP São Carlos', level: 'Iniciante', halfCourt: 1, starts_at:  Time.now + 1000, limit: 10, user: user)
    @match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'Cidade Universitária', level: 'Iniciante', halfCourt: 0, starts_at:  Time.now + 10000, limit: 4, user: user)
    @match3 = Match.create(name: 'Morioh Stands', description: 'Description3', address: 'Quadra Tuiuti Rio', level: 'Iniciante', halfCourt: 0, starts_at:  Time.now + 100000, limit: 6, user: user)

    visit '/matches'
end

Then('the user should see all matches') do
    expect(page).to have_content('Rachão da EACH')
    expect(page).to have_content('Rachão do ICMC')
    expect(page).to have_content('Rachão do IME')
end

When('the user checks the {string} for {string}') do |element, string|
    find(:css, '#' + string).set(1)
end 

When('the user fills in the {string} field with now + {string}') do |field, addition|
    fill_in field, :with => Time.now +  addition.to_i
end