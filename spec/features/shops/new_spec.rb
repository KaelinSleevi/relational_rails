require 'rails_helper'

RSpec.describe 'the Shops Creation' do
    it 'links to the new page from the Shop index' do
        visit '/shops'

        click_link('New Shop')
        expect(current_path).to eq('/shops/new')
    end

    it 'can create a new Shop' do
        visit '/shops/new'

        expect(page.has_field?).to eq(true)

        fill_in "shop[name]", with: "Evo"
        fill_in "shop[ratings]", with: "4.75"
        fill_in "shop[open]", with: "True"

        click_button('Submit')

        expect(current_path).to eq('/shops')
        expect(page).to have_content("Evo")
    end
end