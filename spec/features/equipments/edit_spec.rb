require 'rails_helper'

RSpec.describe 'the Equipment can be edited' do
    before(:each) do
        @evolution = Shop.create!(name: 'Evolution', ratings: 4.25, is_open: false)
        @skisplus = Shop.create!(name: 'Skis Plus', ratings: 3.7, is_open: false)

        @equipment = @evolution.equipments.create!(brand: "Black Crows Skis", price: 667.28, in_stock:  true, shop_id: 1)
        @equipment1 = @skisplus.equipments.create!(brand: "Atomic Maven Skis", price: 299.97, in_stock: false, shop_id: 2)
        @equipment2 = @evolution.equipments.create!(brand: "Giro Ceva Helmet", price: 74.99, in_stock: true, shop_id: 1)
        @equipment3 = @skisplus.equipments.create!(brand: "Smith Holt Helmet", price: 48.99, in_stock: false, shop_id: 2)
        @equipment4 = @evolution.equipments.create!(brand: "Black Crows Poles", price: 44.99, in_stock: true, shop_id: 1)
        @equipment5 = @skisplus.equipments.create!(brand: "Volkl Poles", price: 49.0, in_stock: false, shop_id: 2)
    end

    it 'links to the new page from the Equipment show page' do
        
        visit "/equipments/#{@equipment.id}"
        
        click_link('Edit')
        expect(current_path).to eq("/equipments/#{@equipment.id}/edit")
    end

    it 'can edit a piece of Equipment' do

        visit "/equipments/#{@equipment.id}/edit"

        expect(page.has_field?).to eq(true)

        click_button('Submit')

        expect(current_path).to eq("/equipments/#{@equipment.id}")
        expect(page).to_not have_content("Black Crows Skis")
    end
end
