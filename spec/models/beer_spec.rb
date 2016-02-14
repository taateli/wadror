require 'rails_helper'

RSpec.describe Beer, type: :model do

  it "cant create new beer with no name" do
    beer = Beer.create name:"", style:"Lager"

    expect(Beer.count).to eq(0)
  end

  it "cant create new beer with no style" do
    beer = Beer.create name:"Kolmonen", style:""

    expect(Beer.count).to eq(0)
  end

  it "can create new beer" do
    beer = Beer.create name:"Kolmonen", style:"Lager"

    expect(Beer.count).to eq(1)
  end

  end

