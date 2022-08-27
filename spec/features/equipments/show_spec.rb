require 'rails_helper'

RSpec.describe "the equipments show page" do
    before(:each) do
        @equipment = Equipment.create!(brand: "Black Crows Skis", price: 667.28, in_stock:  false, shop_id: 1)
        @equipment1 = Equipment.create!(brand: "Atomic Maven Skis", price: 299.97, in_stock: true, shop_id: 2)
        @equipment2 = Equipment.create!(brand: "Giro Ceva Helmet", price: 74.99, in_stock: false, shop_id: 1)
        @equipment3 = Equipment.create!(brand: "Smith Holt Helmet", price: 48.99, in_stock: true, shop_id: 2)
        @equipment4 = Equipment.create!(brand: "Black Crows Poles", price: 44.99, in_stock: false, shop_id: 1,)
        @equipment5 = Equipment.create!(brand: "Volkl Poles", price: 49.0, in_stock: true, shop_id: 2)
    end

    it 'displays the ski equipment brand' do
        visit "/equipments/#{@equipment.id}"
       
        expect(page).to have_content(@equipment.brand)
        expect(page).to_not have_content(@equipment1.brand)
    end

    it 'displays the ski equipment price' do
        visit "/equipments/#{@equipment.id}"
        
        expect(page).to have_content(@equipment.price)
        expect(page).to_not have_content(@equipment1.price)
    end

    it 'displays the ski equipment stock' do
        visit "/equipments/#{@equipment.id}"
        
        expect(page).to have_content(@equipment.in_stock)
        expect(page).to_not have_content(@equipment1.in_stock)
    end


    it 'displays the helmet equipment brand' do
        visit "/equipments/#{@equipment2.id}"
        
        expect(page).to have_content(@equipment2.brand)
        expect(page).to_not have_content(@equipment3.brand)
    end

    it 'displays the helmet equipment price' do
        visit "/equipments/#{@equipment2.id}"
    
        expect(page).to have_content(@equipment2.price)
        expect(page).to_not have_content(@equipment3.price)
    end

    it 'displays the helmet equipment stock' do
        visit "/equipments/#{@equipment2.id}"
        
        expect(page).to have_content(@equipment2.in_stock)
        expect(page).to_not have_content(@equipment3.in_stock)
    end


    it 'displays the pole equipment brand' do
        visit "/equipments/#{@equipment4.id}"
        

        expect(page).to have_content(@equipment4.brand)
        expect(page).to_not have_content(@equipment5.brand)
    end

    it 'displays the poles equipment price' do
        visit "/equipments/#{@equipment4.id}"
        
        expect(page).to have_content(@equipment4.price)
        expect(page).to_not have_content(@equipment5.price)
    end

    it 'displays the poles equipment stock' do
        visit "/equipments/#{@equipment4.id}"
        
        expect(page).to have_content(@equipment4.in_stock)
        expect(page).to_not have_content(@equipment5.in_stock)
    end
end