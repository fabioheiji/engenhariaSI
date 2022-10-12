Given("the user is in the page's match registration") do
    visit '/matches/new'
end

When('the user click on the {string} field selecting the checkbox to {string}') do |string, string2|
  if string2 == '1'
    find(:css, '#' + string).set(1)
  end
end

When('the user click on save') do
  click_on 'Salvar'
end

Then('the data must have been saved in the database and {string}, {string}, {string}, {string}, {string}, {string}, {string} should be the last instance') do |string, string2, string3, string4, string5, string6, string7|
  match = Match.order("id").last
  expect(match.name).to eq(string)
  expect(match.description).to eq(string2)
  expect(match.address).to eq(string3)
  expect(match.privateCourt).to eq(ActiveRecord::Type::Boolean.new.cast(string4))
  expect(match.limit).to eq(string5)
  expect(match.halfCourt).to eq(ActiveRecord::Type::Boolean.new.cast(string6))
  expect(match.level).to eq(string7)
end

Then('all the data should habe been saved in the BD AND the user should see the {string}, {string} created') do |string, string2|
  expect(page).to have_content(string)
  expect(page).to have_content(string2)
end