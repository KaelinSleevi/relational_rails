require 'rails_helper'

# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

RSpec.describe "Equipments index page", type: :feature do
    describe "As a visitor" do
        describe "When I visit /equipments" do
            it 'I can see each equiments name' do
                equipment = Equipment.create!(brand: "Black Crows Skis", price: 667.28, in_stock:  false, shop_id: 1)
                equipment1 = Equipment.create!(brand: "Atomic Maven Skis", price: 299.97, in_stock: false, shop_id: 2)
                equipment2 = Equipment.create!(brand: "Giro Ceva Helmet", price: 74.99, in_stock: false, shop_id: 1)
                equipment3 = Equipment.create!(brand: "Smith Holt Helmet", price: 48.99, in_stock: false, shop_id: 2)
                equipment4 = Equipment.create!(brand: "Black Crows Poles", price: 44.99, in_stock: false, shop_id: 1)
                equipment5 = Equipment.create!(brand: "Volkl Poles", price: 49.0, in_stock: false, shop_id: 2)

                visit '/equipments'
                save_and_open_page
                expect(page).to have_content(equipment.brand)
                expect(page).to have_content(equipment1.brand)
                expect(page).to have_content(equipment2.brand)
                expect(page).to have_content(equipment3.brand)
                expect(page).to have_content(equipment4.brand)
                expect(page).to have_content(equipment5.brand)
            end
        end
    end
end