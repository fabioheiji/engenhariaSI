Given("that the user is in the homepage") do
  visit '/'
end

When("the user click on {string}") do |link|
  click_on link
end

Then("the user should be redirected to the matches page") do
  expect(page).to have_current_path(matches_path)
end

Then("the user should be redirected to the sign up page") do
  expect(page).to have_current_path(signup_path)
end

Then("the user should be redirected to the login page") do
  expect(page).to have_current_path(login_path)
end