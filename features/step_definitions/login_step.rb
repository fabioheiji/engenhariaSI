Then("user must be kept on login page") do
  expect(page).to have_current_path(login_path)
end

Then("the user see the message {string}") do |message|
  expect(page).to have_content(message)
end