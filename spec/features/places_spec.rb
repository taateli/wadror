require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [ Place.new( name:"Oljenkorsi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end

  it "when place has no Bars" do
    allow(BeermappingApi).to receive(:places_in).with("kempele").and_return(
          [ ]
    )
    visit places_path
    fill_in('city', with: 'kempele')
    click_button "Search"

    expect(page).to have_content "No locations in kempele"
  end

  it "when there is more than one places" do
    allow(BeermappingApi).to receive(:places_in).with("helsinki").and_return(
        [ Place.new( name:"Kaisla", id: 1 ), Place.new( name:"Stadin Panimo", id: 2) ],
    )
    visit places_path
    fill_in('city', with: 'helsinki')
    click_button "Search"

    expect(page).to have_content "Kaisla"
    expect(page).to have_content "Stadin Panimo"
    save_and_open_page

  end
end