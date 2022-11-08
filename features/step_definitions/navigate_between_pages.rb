When("the user clicks on {string}") do |link|
  click_on link
end

Then("the user should be in {string}") do |path|
  expect(page).to have_current_path(path)
end

Then("the user should not be in {string}") do |path|
  expect(page).not_to have_current_path(path)
end