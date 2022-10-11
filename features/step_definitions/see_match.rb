Given("that the user visits an existing room") do
  match_id = Match.order("id").last.id
  visit match_path(match_id.to_s)
end

Given("that the user visits a non-existing room") do
  nonexistent_id = 1000
  visit match_path(nonexistent_id)
end

Then("the user see the match information") do
  expect(page).to have_content("Rachao da EACH")
  expect(page).to have_content("Rachao entre alunos da Each")
  expect(page).to have_content("Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000")
  expect(page).to have_content("10")
  expect(page).to have_content("true")
  expect(page).to have_content("true")
  expect(page).to have_content("livre")
end

Then("the user see a message that the match does not exist") do
  expect(page).to have_content("The page you were looking for doesn't exist.")
end
