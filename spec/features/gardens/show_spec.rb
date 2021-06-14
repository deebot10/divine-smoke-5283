require 'rails_helper'

RSpec.describe 'Gardern Show page' do
  before(:each) do
    @garden = Garden.create!(name: "Dee Forest", organic: true) 

    @plot_1 = @garden.plots.create!(number: 5, size: 'Large', direction: 'West')    
    @plot_2 = @garden.plots.create!(number: 50, size: 'Small', direction: 'North')    
    @plot_3 = @garden.plots.create!(number: 10, size: 'Large', direction: 'East')    

    @plant_1 = @plot_1.plants.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90) 
    @plant_2 = @plot_2.plants.create!(name: "Daisy", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_3 = @plot_3.plants.create!(name: "Orchard", description: "Prefers rich, well draining soil.", days_to_harvest: 90)

    visit garden_path(@garden)
  end
  
    # User Story 3, Garden's Plants
    # As a visitor
    # When I visit an garden's show page
    # Then I see a list of plants that are included in that garden's plots
    # And I see that this list is unique (no duplicate plants)
    # And I see that this list only includes plants that take less than 100 days to harvest  
  it '' do
  end    
end