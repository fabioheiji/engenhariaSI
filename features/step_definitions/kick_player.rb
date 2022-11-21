Given('that the user visits one of his matches') do
  email = 'fake@gmail.com'
  password = '123456'

  @userFake = User.create(name: 'User Fake', email: email, birth_date: '01/01/2011', password: password, password_confirmation: password, position: 'Power Forward')

  visit '/login'
  fill_in 'session_email', :with => email
  fill_in 'session_password', :with => password
  click_on 'Confirmar'

  @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 20, privateCourt: true, halfCourt: true, level: "Livre", starts_at: '2022-11-05T15:00', user: @userFake)
  user = User.create(name: 'LeBron James', email: "lebron_james@email.com",  password: '123', password_confirmation: '123', birth_date: 'Thu, 14 Oct 1999', position: 'Small Forward (SF)')
  @match.users << user
  match_id = @match.id.to_s
  visit match_path(match_id)
end

Then('the user should see the {string} button next to the name of each participant in the match') do |string|
  expect(page).to have_selector(:link_or_button, string)
end

When('the user clicks the {string} button he should not see the name {string} in the list anymore') do |string, string2|
  click_on string
  expect(page).not_to have_content(string2)
end

Given('that the user is on the page of a match that he does not own') do
  @userFake2 = User.create(name: 'User Fake 2', email: 'fake3@gmail.com', birth_date: '01/01/2011', password: '123456', password_confirmation: '123456', position: 'Power Forward')
  @match2 = Match.create(name: 'Rachao da POLI', description: "Rachao entre alunos da Poli", address: "Butantã, SP", limit: 20, privateCourt: true, halfCourt: true, level: "Livre", starts_at: '2022-11-05T15:00', user: @userFake2)

  for i in 1..3 do
    user = User.create(name: 'LeBron James', email: "lebron_james#{i}@email.com",  password: '123', password_confirmation: '123', birth_date: 'Thu, 14 Oct 1999', position: 'Small Forward (SF)')
    @match2.users << user
  end

  match_id = @match2.id.to_s
  visit match_path(match_id)
end

Then("the user shouldn't see the {string} button next to the name of each participant in the match") do |string|
  expect(page).not_to have_selector(:link_or_button, string)
end
