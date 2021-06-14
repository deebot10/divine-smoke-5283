require 'rails_helper'

RSpec.describe 'Plot Index' do
  before(:each) do
    @garden = Garden.create!(name: "Dee Forest", organic: true) 

    @plot_1 = @garden.plots.create!(number: 5, size: 'Large', direction: 'West')    
    @plot_2 = @garden.plots.create!(number: 50, size: 'Small', direction: 'North')    
    @plot_3 = @garden.plots.create!(number: 10, size: 'Large', direction: 'East')    

    @plant_1 = @plot_1.plants.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90) 
    @plant_2 = @plot_2.plants.create!(name: "Daisy", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    @plant_3 = @plot_3.plants.create!(name: "Orchard", description: "Prefers rich, well draining soil.", days_to_harvest: 90)

    visit '/plots'
  end

    # User Story 1, Plots Index Page
    # As a visitor
    # When I visit the plots index page ('/plots')
    # I see a list of all plot numbers
    # And under each plot number I see names of all that plot's plants  
  describe 'visit' do   
    it 'shows a list of all the plot numbers' do
      visit '/plots' 
      
      expect(page).to have_content('Plot Index')

      expect(page).to have_content(5, "Purple Beauty Sweet Bell Pepper")
      expect(page).to have_content(10, "Dasiy")
      expect(page).to have_content(50, "Orchard")

    end    
  end
end