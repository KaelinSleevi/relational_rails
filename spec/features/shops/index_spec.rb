require 'rails_helper'

RSpec.describe "Shops index page", type: :feature do
    describe "As a visitor" do
        describe "When I visit /shops" do
            it 'I can see each shops name' do
                shop_1 = Shop.create!(name: 'Evolution', ratings: 4.25, is_open: false)
                shop_2 = Shop.create!(name: 'Skis Plus', ratings: 3.7, is_open: false)
                
                visit '/shops'

                expect(page).to have_content(shop_1.name)
            end

            it 'I can see the time and date of creation' do
                shop_1 = Shop.create!(name: 'Evolution', ratings: 4.25, is_open: false)
                shop_2 = Shop.create!(name: 'Skis Plus', ratings: 3.7, is_open: false)
                
                visit '/shops'

                expect(page).to have_content(shop_1.created_at)
            end
        end
    end
end