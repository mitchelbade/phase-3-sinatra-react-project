class Manufacturer < ActiveRecord::Base 
    has_many :vehicles

    def oldest
        Vehicle.oldest(self.id).first
    end

    def newest
        Vehicle.newest(self.id).first
    end

end