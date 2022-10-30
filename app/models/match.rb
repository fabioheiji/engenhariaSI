class Match < ApplicationRecord
  validates :name, presence: { message: ": É obrigatório informar o nome!" }
  validates :description, presence: { message: ": É obrigatório informar a descrição!" }
  validates :address, presence: { message: ": É obrigatório informar o endereço!" }
  validates :level, presence: { message: ": É obrigatório informar o nível!" }
  validates :starts_at, presence: { message: ": É obrigatório informar a data e horário de início!" }

  has_and_belongs_to_many :users

  def self.search(search)
    if search
      where(["name LIKE ?","%#{search}%"])
        .or(where(["address LIKE ?","%#{search}%"]))
    else
      Match.all
    end
  end
end
