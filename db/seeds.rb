require 'faker'

puts "🌱 Seeding spices..."

# Seed your database here

    Manufacturer.create([
        {
            name: 'Toyota',
            based_in: 'Japan',
            rank: 1,
        },
        {
            name: 'Volkswagen',
            based_in: 'Germany',
            rank: 2,
        },
        {
            name: 'Daimler',
            based_in: 'Germany',
            rank: 3,
        },
        {
            name: 'Ford',
            based_in: 'United States',
            rank: 4,
        },
        {
            name: 'Honda',
            based_in: 'Japan',
            rank: 5,
        }
    ])

    Manufacturer.all.each do |manufacturer|
        3.times do
            Vehicle.create(
                name: Faker::Vehicle.model, 
                body_type: Faker::Vehicle.car_type, 
                years_made: Faker::Vehicle.year, 
                description: Faker::Lorem.sentence,
                manufacturer_id: manufacturer.id,
            )
        end
    end

puts "✅ Done seeding!"

# Manufacturer.all.each do |manufacturer|
#     manufacturer.destroy
# end

# Vehicle.all.each do |vehicle|
#     vehicle.destroy
# end
