class CreateVehicleModels < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_models do |t|
      t.string :name
      t.string :body_type
      t.integer :years_made
      t.string :description
      t.integer :manufacturer_id
      t.timestamps
    end
  end
end