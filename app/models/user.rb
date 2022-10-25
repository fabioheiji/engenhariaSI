class User < ApplicationRecord
    validates :name, presence: { message: 'É obrigatório informar o nome!' }
    validates :email, presence: { message: 'É obrigatório informar o email!' } , format: { with: URI::MailTo::EMAIL_REGEXP, message: "Formato de e-mail inválido!" }, uniqueness: { message: 'Já existe um usuário com o email fornecido!' }
    validates :password, presence: { message: 'É obrigatório informar a senha!' }, confirmation: { message: 'A senha e confirmação de senha são diferentes!' }
    validates :password_confirmation, presence: { message: 'É obrigatório informar a confirmação de senha!' }
    validates :birth_date, presence: { message: 'É obrigatório informar a data de nascimento!' }

    has_secure_password
    has_many :matches, dependent: :destroy
end
