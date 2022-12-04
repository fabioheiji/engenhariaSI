Then('the user should see a map') do
    expect(page).to have_css('div#map')
end

Given('the user visits an existing room with wrong address') do
    email = 'test@mail.com'
    password = '123456'
    user = User.create(name: 'Test2', email: email,  password: password, password_confirmation: password, birth_date: 'Thu, 14 Oct 1999', position: 'Power Forward')
    @match = Match.create(name: 'Rachao da EACH Endereco Errado', description: "Rachao entre alunos da Each", address: "Endereco Errado", limit: 15, privateCourt: true, halfCourt: true, level: "Livre", starts_at: Time.now + 10, user: user)
    match_id = @match.id
    visit match_path(match_id.to_s)
end

Then('the user should not see a map') do
    expect(page).to_not have_css('div#map')
end