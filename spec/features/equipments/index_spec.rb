require 'rails_helper'

# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

RSpec.describe "Equipments index page", type: :feature do
    describe "As a visitor" do
        describe "When I visit /equipments" do
            it 'I can see each equiments name' do
                equiment = Equipment.create!(brand: "Black Crows Skis", price: 667.28, in_stock:  false)
                equiment1 = Equipment.create!(brand: "Atomic Maven Skis", price: 299.97, in_stock: false)
                equiment2 = Equipment.create!(brand: "Giro Ceva Helmet", price: 74.99, in_stock: false)
                equiment3 = Equipment.create!(brand: "Smith Holt Helmet", price: 48.99, in_stock: false)
                equiment4 = Equipment.create!(brand: "Black Crows Poles", price: 44.99, in_stock: false)
                equiment5 = Equipment.create!(brand: "Volkl Poles", price: 49.0, in_stock: false)

                visit '/equipments'
                # save_and_open_page

                expect(page).to have_content(equiment.brand)
                expect(page).to have_content(equiment1.brand)
                expect(page).to have_content(equiment2.brand)
                expect(page).to have_content(equiment3.brand)
                expect(page).to have_content(equiment4.brand)
                expect(page).to have_content(equiment5.brand)
            end
        end
    end
end