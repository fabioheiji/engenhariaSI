Given('I open the matches page') do
    user = User.create(name: 'LeBron James', email: 'lebron@james.com', password: '123456', password_confirmation: '123456', birth_date: Date.new(1984, 12, 30), position: 'Power Forward')
    @match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Beginner", user: user)
    @match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: "Beginner", user: user)
    @match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'USP São Carlos', level: "Beginner", user: user)

    visit '/matches'
end

Then('I should see all matches') do
    expect(page).to have_content('Rachão da EACH')
    expect(page).to have_content('Rachão do ICMC')
    expect(page).to have_content('Rachão do IME')
end

When('I fill the {string} field with {string}') do |string, string2|
    fill_in string, :with => string2 
end

Then('I should see {string}') do |string|
    expect(page).to have_content(string)
end

Then('not {string} or {string}') do |string, string2|
   expect(page).not_to have_content(string)
   expect(page).not_to have_content(string2)
end

When('I click on {string}') do |string| 
    click_on string
end

Then('I should be told {string}') do |string|
    page.should have_content(string)
end