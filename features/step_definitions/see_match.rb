Given("that the user visits an existing room") do
  match_id = Match.order("id").last.id
  visit match_path(match_id.to_s)
end

Given("that the user visits a non-existing room") do
  nonexistent_id = 1000
  visit match_path(nonexistent_id)
end
