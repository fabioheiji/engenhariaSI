Before('@oneMatchBefore') do
  email = 'test@mail.com'
  password = '123456'
  user = User.create(name: 'Test', email: email,  password: password, password_confirmation: password, birth_date: 'Thu, 14 Oct 1999', position: 'Power Forward')
  @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 15, privateCourt: true, halfCourt: true, level: "Livre", starts_at: '2022-11-05T15:00', user: user)
end

Before('@loginAsUser') do
  email = 'lebronjames@mail.com'
  password = '123456'
  
  @user = User.create(name: 'LeBron James', email: email,  password: password, password_confirmation: password, birth_date: 'Thu, 14 Oct 1999', position: 'Small Forward (SF)')
  visit '/login'
  fill_in 'session_email', :with => email
  fill_in 'session_password', :with => password
  click_on 'Confirmar'
end

