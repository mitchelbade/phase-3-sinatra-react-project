class Manufacturer < ActiveRecord::Base 
    has_many :vehicle_models

    def oldest
        VehicleModel.oldest(self.id).first
    end

    def newest
        VehicleModel.newest(self.id).first
    end

end