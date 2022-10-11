class Match < ApplicationRecord
    validates :name, presence: { message: ": É obrigatório informar o nome!" }
    validates :description, presence: { message: ": É obrigatório informar a descrição!" }
    validates :address, presence: { message: ": É obrigatório informar o endereço!" }
    validates :level, presence: { message: ": É obrigatório informar o nível!" }
end
