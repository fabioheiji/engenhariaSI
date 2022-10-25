Before('@oneMatchBefore') do
  @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: "10", privateCourt: true, halfCourt: true, level: "livre")
end

Before('@loginAsUser') do
  email = 'test@mail.com'
  password = '123456'
  user = User.create(name: 'Test', email: email,  password: password, password_confirmation: password, birth_date: 'Thu, 14 Oct 1999', position: 'Power Forward')
  visit '/login'
  fill_in 'session_email', :with => email
  fill_in 'session_password', :with => password
  click_on 'Submit'
end

