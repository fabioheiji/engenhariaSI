Given("following user exists") do |table|
  users = table.hashes
  users.each do |user|
    User.create(name: user[:name], email: user[:email], birth_date: user[:birth_date], password_confirmation: user[:password_confirmation], password: user[:password], position: user[:position])
  end
end

Then("user must be kept on login page") do
  expect(page).to have_current_path(login_path)
end

Then("the user see the message {string}") do |message|
  expect(page).to have_content(message)
end