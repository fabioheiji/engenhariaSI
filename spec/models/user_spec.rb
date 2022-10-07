require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it 'invalido sem nome' do
    user = User.new
    user.email = 'Wallaceramonns@usp.br'
    user.password = '123456'
    user.birth_date = Date.new(1999, 10, 14
    user.position = 'Power Forward')
    expect(user).not_to be_valid
  end
  
  it 'invalido sem email' do
    user = User.new
    user.name = 'Wallace Ramon'
    user.password = '123456'
    user.birth_date = Date.new(1999, 10, 14
    user.position = 'Power Forward')
    expect(user).not_to be_valid
  end


end
