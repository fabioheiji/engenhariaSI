Given("the user is in the page's list of matches in after search for a match") do
    @userFake = User.create(name: 'User Fake', email: 'fake@gmail.com', birth_date: '01/01/2011', password_confirmation: '0123456789', password: '0123456789', position: 'armador')    
    visit '/login'
    fill_in 'Email', :with => 'fake@gmail.com'
    fill_in 'Password', :with => '0123456789'
    click_on 'Submit'
end

When('the user click on the match {string}') do |string|
    @matchIbirapuera = Match.create(name: 'Ibirapuera', description: 'Description0', address: 'USP Leste', level: "Beginner")
    visit '/matches'
    expect(page).to have_content('Ibirapuera')
    click_on string
end

When('the user click on the button {string}') do |string|
    click_on string
end

# Then('the user id should be saved in the table {string}') do |string|
    # @userFake = User.create(name: 'User Fake', email: 'fake@gmail.com', birth_date: '01/01/2011', password_confirmation: '0123456789', password: '0123456789', position: 'armador')
    # puts @userFake.id
    # puts @matchIbirapuera.id
    # MatchParticipant.create(user: @userFake.id, match: @matchIbirapuera.id)
# end

Then("the user name should be listed in the match's participants list") do
    expect(page).to have_content('User Fake')
end