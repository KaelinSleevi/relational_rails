require 'rails_helper'

RSpec.describe Shop do
    it {should have_many :equipments}

    describe 'it can have a equipment count' do
        it 'count of equipment' do
            evolution = Shop.create!(name: 'Evolution', ratings: 4.25, is_open: false)
            skisplus = Shop.create!(name: 'Skis Plus', ratings: 3.7, is_open: false)

            equipment = evolution.equipments.create!(brand: "Black Crows Skis", price: 667.28, in_stock:  true, shop_id: 1)
            equipment1 = skisplus.equipments.create!(brand: "Atomic Maven Skis", price: 299.97, in_stock: false, shop_id: 2)
            equipment2 = evolution.equipments.create!(brand: "Giro Ceva Helmet", price: 74.99, in_stock: true, shop_id: 1)
            equipment3 = skisplus.equipments.create!(brand: "Smith Holt Helmet", price: 48.99, in_stock: false, shop_id: 2)
            equipment4 = evolution.equipments.create!(brand: "Black Crows Poles", price: 44.99, in_stock: true, shop_id: 1)
            equipment5 = skisplus.equipments.create!(brand: "Volkl Poles", price: 49.0, in_stock: false, shop_id: 2)
            
            expect(evolution.count_of_equipment).to eq(3)
            expect(skisplus.count_of_equipment).to eq(3)
        end
    end
end
