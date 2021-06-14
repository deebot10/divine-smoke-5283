require 'rails_helper'

RSpec.describe 'Gardern Show page' do
  before(:each) do
    @garden = Garden.create!(name: "Dee Forest", organic: true) 

    @plot = @garden.plots.create!(number: 5, size: 'Large', direction: 'West')    

    @plant_1 = @plot.plants.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90) 
    @plant_2 = @plot.plants.create!(name: "Daisy", description: "Prefers rich, well draining soil.", days_to_harvest: 80)
    @plant_3 = @plot.plants.create!(name: "Orchard", description: "Prefers rich, well draining soil.", days_to_harvest: 200)
    @plant_4 = @plot.plants.create!(name: "Daisy", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_5 = @plot.plants.create!(name: "Bonsai", description: "Prefers rich, well draining soil.", days_to_harvest: 50)
    @plant_6 = @plot.plants.create!(name: "Heart Flower", description: "Prefers rich, well draining soil.", days_to_harvest: 110)

    visit garden_path(@garden)
  end
  
    # User Story 3 
  it 'shows a list of plants included in plots' do

    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to have_content(@plant_5.name)
    
    expect(page).to_not have_content(@plant_3.name)
    # expect(page).to_not have_content(@plant_4.name)
    expect(page).to_not have_content(@plant_6.name)
  end    
end