class Plant < ApplicationRecord
  has_many :plotted_plants
  has_many :plots, through: :plotted_plants

  def harvet_time(plant)
    # select(name)
    # .where('days_to_harvest < 100')    
    if days_to_harvest < 100
      return plant.name
    end
  end
end
