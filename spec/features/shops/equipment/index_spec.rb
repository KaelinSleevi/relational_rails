require 'rails_helper'

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

        expect(page).to have_content(@equipment.price)
        expect(page).to_not have_content(@equipment1.price)
    end

    it 'shows whether or not it is in stock for each piece of equipment' do
        
        visit "/shops/#{@evolution.id}/equipments"
        
        expect(page).to have_content("Stock? In Stock")
        expect(page).to_not have_content("Stock? Out of Stock")
    end

    
    it 'The user is able to see a link at the top of the page' do
        visit "/shops/#{@evolution.id}/equipments"

        click_link 'Equipment Index'
        expect(page).to have_current_path(equipments_path)
    end

    it 'The user is able to see a link at the top of the page' do
        visit "/shops/#{@evolution.id}/equipments"
       
        click_link 'Shops Index'
        expect(page).to have_current_path(shops_path)
    end
end