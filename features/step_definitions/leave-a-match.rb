Given("the user is in the page's match that he is already participating") do
    @userFake = User.create(name: 'User Fake', email: 'fake@gmail.com', birth_date: '01/01/2011', password_confirmation: '0123456789', password: '0123456789', position: 'Power Forward')    
    visit '/login'
    fill_in 'session_email', :with => 'fake@gmail.com'
    fill_in 'session_password', :with => '0123456789'
    click_on 'Confirmar'
    @matchIbirapuera = Match.create(name: 'Ibirapuera', description: 'Description0', address: 'USP Leste', level: 'Iniciante', starts_at: '2022-11-05T15:00', limit: 15, user: @userFake)
    visit '/matches'
    expect(page).to have_content('Ibirapuera')
    click_on "Ibirapuera"
    click_on "Participar"
    expect(page).to have_content('User Fake')
end

Then('the user should not see their name appearing in the match participant list') do
    expect(page).not_to have_content('User Fake')
end

Given("the user is in the page's match that he is not participating") do
    @userFake = User.create(name: 'User Fake 2', email: 'fake@gmail.com', birth_date: '01/01/2011', password_confirmation: '0123456789', password: '0123456789', position: 'Power Forward')
    @matchOwner = User.create(name: 'Match Owner', email: 'match_owner@gmail.com', birth_date: '01/01/2011', password_confirmation: '0123456789', password: '0123456789', position: 'Power Forward')

    visit '/login'
    fill_in 'session_email', :with => 'fake@gmail.com'
    fill_in 'session_password', :with => '0123456789'
    click_on 'Confirmar'
    @matchIbirapuera = Match.create(name: 'Ibirapuera', description: 'Description0', address: 'USP Leste', level: 'Iniciante', starts_at: '2022-11-05T15:00', limit: 10, user: @matchOwner)
    visit '/matches'
    expect(page).to have_content('Ibirapuera')
    click_on "Ibirapuera"
end

Then('the user should not see the button {string}') do |string|
    expect(page).not_to have_button(string)
end