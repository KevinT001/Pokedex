require 'rails_helper'

RSpec.describe 'Region index page' do 
  it 'I see the name of each parent' do 
    johto = Region.create!(name: "Johto", total_num_in_region: 151, caught_all_in_region: false)
    sinoh = Region.create!(name: "Sinnoh", total_num_in_region: 301, caught_all_in_region: true )

    visit "/regions"
    save_and_open_page
    expect(page).to have_content(johto.name)
    expect(page).to have_content(sinoh.name)
    expect(page).to have_content(johto.total_num_in_region)
    expect(page).to have_content(sinoh.total_num_in_region)
    
  end
end