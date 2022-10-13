Given('I open the matches page') do
    @match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: "Beginner")
    @match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: "Beginner")
    @match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'USP São Carlos', level: "Beginner")

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