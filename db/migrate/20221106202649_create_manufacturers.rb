class CreateManufacturers < ActiveRecord::Migration[6.1]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :based_in
      t.integer :rank
      t.timestamps
    end
  end
end