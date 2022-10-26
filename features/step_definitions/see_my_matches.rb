Given('I have created matches') do
    user = User.create(name: 'LeBron James', email: 'lebron@james.com', password: '123456', password_confirmation: '123456', birth_date: Date.new(1984, 12, 30), position: 'Power Forward')
    match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Beginner", user: user) 
    match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: "Beginner", user: user)
    match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'USP São Carlos', level: "Beginner", user: user)

    not_user = user = User.create(name: 'Not LeBron James', email: 'notlebron@james.com', password: 'not123456', password_confirmation: 'not123456', birth_date: Date.new(1948, 03, 21), position: 'Not Power Forward')
    not_ match = Match.create(name: 'Not Rachão da EACH', description: 'Not Description0', address: 'Not USP Leste', level: "Not Beginner", user: not_user) 
end

Given('I have not created any matches yet') do
    user = User.create(name: 'LeBron James', email: 'lebron@james.com', password: '123456', password_confirmation: '123456', birth_date: Date.new(1984, 12, 30), position: 'Power Forward')
end

When('I go to my matches page') do
    visit "/users/#id/matches"
end

Then('I should see all my matches') do
    expect(page).to have_content('Rachão da EACH')
    expect(page).to have_content('Rachão do ICMC')
    expect(page).to have_content('Rachão do IME')
end

Then('not matches created by anyone else') do
    expect(page).not_to have_content('Not Rachão da EACH')
end
  