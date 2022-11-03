Given('I open the matches page') do
    @match0 = Match.create(name: 'Rachão da EACH', description: 'Description0', address: 'USP Leste', level: 'Beginner', starts_at: '2022-11-05T15:00', limit: 15)
    @match1 = Match.create(name: 'Rachão do ICMC', description: 'Description1', address: 'Cidade Universitária', level: 'Beginner', starts_at: '2022-11-05T15:00', limit: 15)
    @match2 = Match.create(name: 'Rachão do IME', description: 'Description2', address: 'USP São Carlos', level: 'Beginner', starts_at: '2022-11-05T15:00', limit: 15)

    visit '/matches'
end

Then('I should see all matches') do
    expect(page).to have_content('Rachão da EACH')
    expect(page).to have_content('Rachão do ICMC')
    expect(page).to have_content('Rachão do IME')
end
