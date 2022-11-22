Given('the user visits last created match') do
    match_id = (Match.order("id").last.id).to_s
    visit match_path(match_id)
end
  
Given('a newly created match with the maximum number of participants reached') do
    @userFake = User.create(name: 'User Fake 2', email: 'fake@gmail.com', birth_date: '01/01/2011', password_confirmation: '0123456789', password: '0123456789', position: 'Power Forward')
    @match = Match.create(name: 'Rachao da EACH', description: "Rachao entre alunos da Each", address: "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000", limit: 20, privateCourt: true, halfCourt: true, level: "Livre", starts_at: Time.now + 10, user: @userFake)
    for i in 1..20 do
        user = User.create(name: 'LeBron James', email: "lebron_james#{i}@email.com",  password: '123', password_confirmation: '123', birth_date: 'Thu, 14 Oct 1999', position: 'Small Forward (SF)')
        @match.users << user
    end
end

Given("the user is in the page's list of matches in after search for a match") do
    @userFake = User.create(name: 'User Fake', email: 'fake@gmail.com', birth_date: '01/01/2011', password_confirmation: '0123456789', password: '0123456789', position: 'armador')    
    visit '/login'
    fill_in 'session_email', :with => 'fake@gmail.com'
    fill_in 'session_password', :with => '0123456789'
    click_on 'Confirmar'
end

When('the user clicks on the match {string}') do |string|
    @matchIbirapuera = Match.create(name: 'Ibirapuera', description: 'Description0', address: 'USP Leste', level: "Beginner", starts_at: Time.now + 10, user: @userFake)
    visit '/matches'
    expect(page).to have_content('Ibirapuera')
    click_on string
end

When('the user clicks on the button {string}') do |string|
    click_on string
end

Then("the user name should be listed in the match's participants list") do
    expect(page).to have_content('User Fake')
end

Then('the user should not see their name appearing more than once') do
    expect(page).to_not have_content('User Fake').twice
end

