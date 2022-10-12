class Match < ApplicationRecord
    validates :name, :address, :description, presence: true

    def self.search(search)
        if search
            where(["name LIKE ?","%#{search}%"])
            .or(where(["address LIKE ?","%#{search}%"]))
        else
            Match.all
        end
    end
end
