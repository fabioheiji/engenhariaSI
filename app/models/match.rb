class Match < ApplicationRecord
  validates :name, presence: { message: ": É obrigatório informar o nome!" }
  validates :description, presence: { message: ": É obrigatório informar a descrição!" }
  validates :address, presence: { message: ": É obrigatório informar o endereço!" }
  validates :level, presence: { message: ": É obrigatório informar o nível!" }
  validates :starts_at, presence: { message: ": É obrigatório informar a data e horário de início!" }
  validates_datetime :starts_at, after: lambda { Time.current }

  belongs_to :user
  has_and_belongs_to_many :users


  validates(
    :limit, 
    presence: { message: ": É obrigatório informar o limite!" }, 
    numericality: { only_integer: true, message: ": Insira apenas números" }, 
    numericality: { in: 2..20, message: ": Limite de participantes deve estar entre 2 e 20" }
  )

  scope :filter_by_starts_at, -> (time) { where starts_at: time.. }
  scope :filter_by_limit, -> (limit) { where limit: limit }
  scope :filter_by_level, -> (level) { where level: level }
  scope :filter_by_half_court, -> (halfCourt) { where halfCourt: halfCourt }

  def self.search(search)
    if search 
      where(["LOWER(name) LIKE LOWER(?)","%#{search}%"])
        .or(where(["LOWER(address) LIKE LOWER(?)","%#{search}%"]))
        .or(where(["LOWER(description) LIKE LOWER(?)","%#{search}%"]))
    else
      Match.all
    end
  end
end
