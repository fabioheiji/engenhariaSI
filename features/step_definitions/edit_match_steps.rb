Given("the current user not created last match") do
  email = 'lebronjames@email.com'
  password = '123456'
  user = User.create(name: 'LeBron James', email: email,  password: password, password_confirmation: password, birth_date: 'Thu, 14 Oct 1999', position: 'Power Forward')
  @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 15, privateCourt: true, halfCourt: true, level: "Livre", starts_at: '2022-11-05T15:00', user: user)
end

Given("the current user created last match") do
  @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 15, privateCourt: false, halfCourt: false, level: "Livre", starts_at: '2022-11-05T15:00', user: @user)
end

Given("the user should be in last created match") do
  match = Match.order("id").last
  expect(page).to have_current_path(match_path(match))
end

Given("the user visits last created match edit page") do
  match = Match.order("id").last
  visit edit_match_path(match.id)
end