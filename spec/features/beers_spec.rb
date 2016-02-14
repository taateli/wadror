require 'rails_helper'
include Helpers

describe "Create a beer" do
  it "One should be created" do
    visit new_beer_path
    fill_in('beer_name', with:'IPA')
    
    save_and_open_page

    expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(1)


  end
  end