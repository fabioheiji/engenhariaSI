When('the user fills in the {string} field with {string}') do |input, value|
    fill_in input, :with => value
end

When('the user selects in the {string} field with {string}') do |input, value|
    select value, :from => input
end
  
Then('the user must be saved in the database') do
    user = User.order("id").last
    expect(user.name).to eq('Wallace Ramon')
    expect(user.email).to eq('Wallaceramonns@usp.br')
    expect(user.password_digest).to be_truthy
    expect(user.birth_date).to eq(Date.new(1999, 10, 14))
    expect(user.position).to eq('Power Forward')
end
  