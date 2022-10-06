Given('that the user is on the registration page') do
    visit '/signup'
end
  
When('the user fills in the {string} field with {string}') do |string, string2|
    fill_in string, :with => string2
end
  
When('click save') do
    click_on 'Salvar'
end
  
Then('the user must be saved in the database') do
    user = User.order("id").last
    expect(user.name).to eq('Wallace Ramon')
    expect(user.email).to eq('Wallaceramonns@usp.br')
    expect(user.password).to eq('123456')
    expect(user.birth_date).to eq(Thu, 14 Oct 1999)
    expect(user.position).to eq('Power Forward')
end
  
Then('the user should be redirected to the login page') do
    pending # Write code here that turns the phrase above into concrete actions
end
  
When('the user leaves the {string} field empty') do |string|
    pending # Write code here that turns the phrase above into concrete actions
end
  
Then('the user should see the error message {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
end
  
When('the user fills in the field {string} com {string}') do |string, string2|
    pending # Write code here that turns the phrase above into concrete actions
end