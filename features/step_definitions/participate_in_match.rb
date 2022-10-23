Given("the user is in the page's list of matches in after search for a match") do
    @matchIbirapuera = Match.create(name: 'Ibirapuera', description: 'Description0', address: 'USP Leste', level: "Beginner")
    visit '/matches'
    puts "@matchIbirapuera.id:"
    puts @matchIbirapuera.id
    puts 'fim'
    expect(page).to have_content('Ibirapuera')

end

When('the user click on the match {string}') do |string|
    click_on string
end

When('the user click on the button {string}') do |string|
    click_on string
end

Then('the user id should be saved in the table {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
end