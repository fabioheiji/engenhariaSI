Given("that user visits existing match page") do
  @match = Match.create(name: 'Match', description: "Description", address: "Address", limit: "10", private_quort: true, half_quort: true, level: "Beginner")
  visit "/matches/#{@match.id}"
end

Given("that user visits non-existing match page") do
  visit "/matches/2"
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
