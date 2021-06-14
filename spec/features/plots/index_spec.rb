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

    # User Story 1
  describe 'visit' do   
    it 'shows a list of all the plot numbers and plant names' do
      
      expect(page).to have_content('Plot Index')

      expect(page).to have_content(@plot_1.number)
      expect(page).to have_content(@plot_2.number)
      expect(page).to have_content(@plot_3.number)

      expect(page).to have_content(@plant_1.name)
      expect(page).to have_content(@plant_2.name)
      expect(page).to have_content(@plant_3.name)
    end    
            
        # User Story 2
    it 'can destroy destroy a plant from the plot index ' do

        expect(page).to have_content("Remove #{@plant_2.name}")
        click_link "Remove #{@plant_2.name}"

        expect(current_path).to eq('/plots')

        expect(page).to have_content(@plant_2.name)
    end
  end
end