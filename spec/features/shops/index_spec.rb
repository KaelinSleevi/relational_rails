require 'rails_helper'

# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe "Shops index page", type: :feature do
    describe "As a visitor" do
        describe "When I visit /shops" do
            it 'I can see each shops name' do
                shop_1 = Shop.create!(name: 'Evolution', ratings: 4.25, is_open: false)
                shop_2 = Shop.create!(name: 'Skis Plus', ratings: 3.7, is_open: false)
                
                visit '/shops'
                # save_and_open_page

                expect(page).to have_content(shop_1.name)
            end
        end
    end
end