require 'rails_helper'
# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

RSpec.describe 'Shops Equipment Index' do
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

    it 'shows all the names for the shop' do

        visit "/shops/#{@evolution.id}/equipments"

        expect(page).to have_content(@evolution.name)
        expect(page).to_not have_content(@skisplus.name)

    end

    it 'shows the brands for each piece of equipment' do
      
        visit "/shops/#{@evolution.id}/equipments"
        expect(page).to have_content(@equipment.brand)
        expect(page).to_not have_content(@equipment1.brand)
    end

    it 'shows the price for each piece of equipment' do

        visit "/shops/#{@evolution.id}/equipments"
        save_and_open_page
        expect(page).to have_content(@equipment.price)
        expect(page).to_not have_content(@equipment1.price)
    end

    it 'shows whether or not it is in stock for each piece of equipment' do
        
        visit "/shops/#{@evolution.id}/equipments"
        
        expect(page).to have_content("Stock? In Stock")
        expect(page).to_not have_content("Stock? Out of Stock")
    end

    xit 'links to each piece of equipments show page' do

        visit "/shops/#{@evolution.id}/equipments"
    
    end
end