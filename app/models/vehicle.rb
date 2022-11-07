class Vehicle < ActiveRecord::Base 
    belongs_to :manufacturer

    # scope :created_before, ->(time) { where('created_at < ?', time) }
    scope :oldest, ->(manufacturer_id) { where('manufacturer_id = ?', manufacturer_id).order(years_made: :asc).limit(1)}
    scope :newest, ->(manufacturer_id) { where('manufacturer_id = ?', manufacturer_id).order(years_made: :desc).limit(1)}
    

end