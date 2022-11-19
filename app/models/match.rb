class Match < ApplicationRecord
  validates :name, presence: { message: ": É obrigatório informar o nome!" }
  validates :description, presence: { message: ": É obrigatório informar a descrição!" }
  validates :address, presence: { message: ": É obrigatório informar o endereço!" }
  validates :level, presence: { message: ": É obrigatório informar o nível!" }
  validates :starts_at, presence: { message: ": É obrigatório informar a data e horário de início!" }

  belongs_to :user

  has_and_belongs_to_many :users

  validates(
    :limit, 
    presence: { message: ": É obrigatório informar o limite!" }, 
    numericality: { only_integer: true, message: ": Insira apenas números" }, 
    numericality: { in: 2..20, message: ": Limite de participantes deve estar entre 2 e 20" }
  )

  validate :start_date_is_earlier_than_now?

  def self.search(search)
    if search
      where(["name LIKE ?","%#{search}%"])
        .or(where(["address LIKE ?","%#{search}%"]))
    else
      Match.all
    end
  end

  def start_date_is_earlier_than_now?
    if starts_at.present? && starts_at.past?
      errors.add :starts_at, "Data de início precisar ser maior ou igual a agora"
    end
  end
end
