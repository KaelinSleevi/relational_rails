require 'rails_helper'

RSpec.describe "the shops show page" do
    before(:each) do
        @evolution = Shop.create!(name: 'Evolution', ratings: 4.25, is_open: true)
        @skisplus = Shop.create!(name: 'Skis Plus', ratings: 3.7, is_open: false)

        @equipment = @evolution.equipments.create!(brand: "Black Crows Skis", price: 667.28, in_stock:  true, shop_id: 1)
        @equipment1 = @skisplus.equipments.create!(brand: "Atomic Maven Skis", price: 299.97, in_stock: false, shop_id: 2)
        @equipment2 = @evolution.equipments.create!(brand: "Giro Ceva Helmet", price: 74.99, in_stock: true, shop_id: 1)
        @equipment3 = @skisplus.equipments.create!(brand: "Smith Holt Helmet", price: 48.99, in_stock: false, shop_id: 2)
        @equipment4 = @evolution.equipments.create!(brand: "Black Crows Poles", price: 44.99, in_stock: true, shop_id: 1)
        @equipment5 = @skisplus.equipments.create!(brand: "Volkl Poles", price: 49.0, in_stock: false, shop_id: 2)
    end

    it 'displays the shop name' do
        visit "/shops/#{@evolution.id}"
        
        expect(page).to have_content(@evolution.name)
        expect(page).to_not have_content(@skisplus.name)
    end

    it 'displays the shops ratings' do
        visit "/shops/#{@evolution.id}"
        
        expect(page).to have_content(@evolution.ratings)
        expect(page).to_not have_content(@skisplus.ratings)
    end

    it 'displays if the shop is open' do
        visit "/shops/#{@evolution.id}"
        
        expect(page).to have_content(@evolution.is_open)
        expect(page).to_not have_content(@skisplus.is_open)
    end

    it 'displays the shop name' do
        visit "/shops/#{@skisplus.id}"
        
        expect(page).to have_content(@skisplus.name)
        expect(page).to_not have_content(@evolution.name)
    end

    it 'displays the shops ratings' do
        visit "/shops/#{@skisplus.id}"
        save_and_open_page
        expect(page).to have_content(@skisplus.ratings)
        expect(page).to_not have_content(@evolution.ratings)
    end

    it 'displays if the shop is open' do
        visit "/shops/#{@skisplus.id}"

        expect(page).to have_content(@skisplus.is_open)
        expect(page).to_not have_content(@evolution.is_open)
    end    
end