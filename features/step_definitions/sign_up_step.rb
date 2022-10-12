Given('that the user is on the registration page') do
    visit signup_path
end

Given('that the user is on the login page') do
    visit login_path
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
    expect(user.password_digest).to be_truthy
    expect(user.birth_date).to eq(Date.new(1999, 10, 14))
    expect(user.position).to eq('Power Forward')
end
  
When('the user leaves the {string} field empty') do |string|
    fill_in string, :with => ""
end
  
Then('the user should see the error message {string}') do |string|
    expect(page).to have_content(string)
end