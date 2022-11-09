Given('the user is seeing matches created by other users') do
    visit '/matches' 
end

Then('the user should not see the button {string}') do |button|
    expect(page).to have_no_button(button)
end

Then('the user should not see the match {string} anymore') do |match|
    expect(page).to have_no_css(match)
end