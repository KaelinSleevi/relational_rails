require 'rails_helper'

RSpec.describe "the songs show page" do
    before(:each) do
        @shop = Shop.create!(name: 'Evolution', ratings: 4.25, is_open: false)
        @shop2 = Shop.create!(name: "Skis Plus", ratings: 3.7, is_open: true)
    end
#User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
    it 'displays the shop name' do
        visit "/shops/#{@shop.id}"
        
        expect(page).to have_content(@shop.name)
        expect(page).to_not have_content(@shop2.name)
    end

    it 'displays the shops ratings' do
        visit "/shops/#{@shop.id}"
        
        expect(page).to have_content(@shop.ratings)
        expect(page).to_not have_content(@shop2.ratings)
    end

    it 'displays if the shop is open' do
        visit "/shops/#{@shop.id}"
        
        save_and_open_page
        expect(page).to have_content(@shop.is_open)
        expect(page).to_not have_content(@shop2.is_open)
    end

    it 'displays the shop name' do
        visit "/shops/#{@shop2.id}"
        
        expect(page).to have_content(@shop2.name)
        expect(page).to_not have_content(@shop.name)
    end

    it 'displays the shops ratings' do
        visit "/shops/#{@shop2.id}"
        
        expect(page).to have_content(@shop2.ratings)
        expect(page).to_not have_content(@shop.ratings)
    end

    it 'displays if the shop is open' do
        visit "/shops/#{@shop2.id}"
        
        save_and_open_page
        expect(page).to have_content(@shop2.is_open)
        expect(page).to_not have_content(@shop.is_open)
    end    
end