require 'rails_helper'
# User Story 11, Parent Creation 

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

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