Given("an existing match") do
  @match = Match.create(name: 'Match', description: "Description", address: "Address", limit: "10", privateCourt: true, halfCourt: true, level: "Beginner")
end

Given("an non-existing match") do
end

When("the user visits the match {string}") do |string|
  visit "/matches/#{string}"
end

Then("the user see the match information") do
  expect(page).to have_content("Name")
  expect(page).to have_content("Description")
  expect(page).to have_content("Address")
  expect(page).to have_content("10")
  expect(page).to have_content("t")
  expect(page).to have_content("t")
  expect(page).to have_content("Beginner")
end

Then("the user see a message that the match does not exist") do
  expect(page).to have_content("The page you were looking for doesn't exist.")
end
