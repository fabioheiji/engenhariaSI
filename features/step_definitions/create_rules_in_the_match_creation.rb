Given("the user is in the page's match registration - error registration") do
    visit '/matches/new'
end

When('the user fills in the {string} field with {string} - error registration') do |string, string2|
    fill_in string, :with => string2
end

When('the user click on the {string} field selecting the checkbox to {string} - error registration') do |string, string2|
    if string2 == '1'
        find(:css, '#' + string).set(1)
      end
end

When('the user click on save - error registration') do
    click_on 'Salvar'
end

Then('I should see the error message {string} - error registration') do |string|
    expect(page).to have_content(string)
end