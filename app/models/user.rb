class User < ApplicationRecord
    validates :name, presence: { message: 'É obrigatório informar o nome!' }
    validates :email, presence: { message: 'É obrigatório informar o email!' }
    validates :password, presence: { message: 'É obrigatório informar a senha!' }
end
