Given('the user is in the match name {string}, description {string}, address {string}, privateCourt {string}, limit {string}, halfCourt {string}, level {string}, starts_at {string}, privateMatch {string}, privateMatchPassword {string}') do |string, string2, string3, string4, string5, string6, string7, string8, string9, string10|
    @userFake = User.create(name: 'User Fake', email: 'fake@gmail.com', birth_date: '01/01/2011', password_confirmation: '0123456789', password: '0123456789', position: 'armador')    

    @match = Match.create(name: string, description: string2, address: string3, privateCourt: string4, limit: string5, halfCourt: string6, level: string7, starts_at: string8, privateMatch: string9, privateMatchPassword: string10, user: @userFake)

    visit '/login'
    fill_in 'session_email', :with => @userFake.email
    fill_in 'session_password', :with => @userFake.password
    click_on 'Confirmar'

    visit '/matches'
    expect(page).to have_content(string)
    click_on string
end