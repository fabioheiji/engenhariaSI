Given('the user has created or participated in matches') do
    user = @user
    match0 = Match.create(id: 0, name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Beginner", user: user, starts_at: Time.now + 10, limit: 10) 
    match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: "Beginner", user: user, starts_at: Time.now + 10, limit: 10)
    match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'USP São Carlos', level: "Beginner", user: user, starts_at: Time.now + 10, limit: 10)
    
    not_user = User.create(name: 'LeBron James', email: 'lebron@james.com', password: '123456', password_confirmation: '123456', birth_date: Date.new(1984, 12, 30), position: 'Power Forward')
    not_match = Match.create(name: 'Not Rachão da EACH', description: 'Not Description0', address: 'Not USP Leste', level: "Not Beginner", user: not_user) 
    match3 = Match.create(name: 'New Rachão da EACH', description: 'Not Description0', address: 'Not USP Leste', level: "Not Beginner", user: not_user, users: user) 
end

Then('the user should see all owned matches and the matches he participated in') do
    expect(page).to have_content('Rachão da EACH')
    expect(page).to have_content('Rachão do ICMC')
    expect(page).to have_content('Rachão do IME')
    expect(page).to have_content('New Rachão da EACH')
end

Then('not matches he is not participating') do
    expect(page).not_to have_content('Not Rachão da EACH')
end
