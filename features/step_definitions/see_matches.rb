Then("the user must be a match table as follows") do |table|
  elements = table.hashes
  elements.each do |match|
    expect(page).to have_content(match[:name])
    expect(page).to have_content(match[:description])
    expect(page).to have_content(match[:address])
  end
end

When("when the user clicks see, on the first element of the table") do
  match_id = (Match.order("id").last.id).to_s
  find("#view-#{match_id}").click
end

Then("the user see the match details page") do
  match_id = (Match.order("id").last.id).to_s
  expect(page).to have_current_path(match_path(match_id))
end
