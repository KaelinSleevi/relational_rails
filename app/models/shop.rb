class Shop < ApplicationRecord
    has_many :equipments, dependent: :destroy

    def count_of_equipment
        self.equipments.count
    end
end