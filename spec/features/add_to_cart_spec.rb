require 'rails_helper'

RSpec.feature "Visitor add product", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    3.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 3,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit '/'
    first('.product').click_on(class: 'btn btn-primary')
    # find('button.btn btn-primary').click
    # first('.product').click_button('Add')

    # DEBUG
    # save_screenshot
    # puts page.html


    # VERIFY
    expect(page).to have_text 'My Cart (1)'
  end
end