Given("following user exists") do |table|
  users = table.hashes
  users.each do |user|
    User.create(name: user[:name], email: user[:email], birth_date: user[:birth_date], password_confirmation: user[:password_confirmation], password: user[:password], position: user[:position])
  end
end

Then("the user should see the text {string}") do |message|
  expect(page).to have_content(message)
end

Then("the user should not see the text {string}") do |message|
  expect(page).not_to have_content(message)
end