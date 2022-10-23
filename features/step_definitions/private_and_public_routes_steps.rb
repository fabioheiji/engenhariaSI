Given('that the user is not logged in') do
  visit '/'
end

Then('the user should see the link for {string} in the header') do |string|
  expect(page).to  have_content(string)
end

When('the user tries to access the link {string}') do |string|
  visit string
end

Then('the user should be redirected to login page') do
  expect(page).to  have_content('You must be logged in to access this section')
  expect(page).to have_current_path(login_path)
end


Given('that the user is logged in') do
  email = 'test@mail.com'
  password = '123456'

  user = User.create(name: 'Joao', email: email,  password: password, password_confirmation: password, birth_date: 'Thu, 14 Oct 1999', position: 'Power Forward')
  
  visit '/login'
  fill_in 'session_email', :with => email
  fill_in 'session_password', :with => password
  click_on 'Submit'
end

Then('the user should be redirected to the desired page') do
  expect(page).not_to be(login_path)
end
