Given('the user visits last created match') do
    match_id = (Match.order("id").last.id).to_s
    visit match_path(match_id)
end

Given("the user is in the page's list of matches in after search for a match") do
    @userFake = User.create(name: 'User Fake', email: 'fake@gmail.com', birth_date: '01/01/2011', password_confirmation: '0123456789', password: '0123456789', position: 'armador')    
    visit '/login'
    fill_in 'session_email', :with => 'fake@gmail.com'
    fill_in 'session_password', :with => '0123456789'
    click_on 'Confirmar'
end

When('the user click on the match {string}') do |string|
    @matchIbirapuera = Match.create(name: 'Ibirapuera', description: 'Description0', address: 'USP Leste', level: 'Beginner', starts_at: '2022-11-05T15:00')
    visit '/matches'
    expect(page).to have_content('Ibirapuera')
    click_on string
end

When('the user click on the button {string}') do |string|
    click_on string
end

Then("the user name should be listed in the match's participants list") do
    expect(page).to have_content('User Fake')
end

Then('the user should not see their name appearing more than once') do
    expect(page).to_not have_content('User Fake').twice
end