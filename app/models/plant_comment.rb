class PlantComment < ApplicationRecord
    
  belongs_to :customer
  belongs_to :plant
  
end
