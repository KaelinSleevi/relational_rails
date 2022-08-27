class Shop < ApplicationRecord
    has_many :equipments

    def count_of_equipment
        self.equipments.count
    end
end