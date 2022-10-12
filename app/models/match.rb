class Match < ApplicationRecord
    validates :name, :address, :description, presence: true

    def self.search(search)
        if search
            where(["name LIKE ?","%#{search}%"])
            .or(where(["address LIKE ?","%#{search}%"]))
#            .select(:id, :name, :description)
        else
            Match.all
        end
    end
end
