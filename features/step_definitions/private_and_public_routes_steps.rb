Given('the user is not logged in') do
  visit '/'
end

When('the user visits {string}') do |link|
  visit link
end

Given('the user is logged in') do
  email = 'test@mail.com'
  password = '123456'

  user = User.create(name: 'Joao', email: email,  password: password, password_confirmation: password, birth_date: 'Thu, 14 Oct 1999', position: 'Power Forward')
  
  visit '/login'
  fill_in 'session_email', :with => email
  fill_in 'session_password', :with => password
  click_on 'Confirmar'
end
