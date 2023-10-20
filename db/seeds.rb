# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# db/seeds.rb

# Create and save five vehicle records

# db/seeds/create_sample_vehicles.rb

vehicles_data = [
  {
    vehicle_type: 'Sedan',
    license_plate: 'ABC 123',
    color: 'Blue',
    status: 'Available',
    active: true,
    insurance_info: 'Sample insurance info 1',
    registration_info: 'Sample registration info 1',
    capacity: 4,
    year: 2022,
    details: 'Sample details for vehicle 1'
  },
  {
    vehicle_type: 'SUV',
    license_plate: 'XYZ 789',
    color: 'Red',
    status: 'In Service',
    active: true,
    insurance_info: 'Sample insurance info 2',
    registration_info: 'Sample registration info 2',
    capacity: 6,
    year: 2021,
    details: 'Sample details for vehicle 2'
  },
  # Add more vehicle records as needed
]

vehicles_data.each do |vehicle_params|
  Vehicle.create!(vehicle_params)
end


drivers_data = [
  {
    name: 'John Doe',
    license_number: '12345ABC',
    vehicle_type: 'Sedan',
    phone: '555-555-5555',
    email: 'john.doe@example.com'
  },
  {
    name: 'Jane Smith',
    license_number: '6789XYZ',
    vehicle_type: 'SUV',
    phone: '555-555-5556',
    email: 'jane.smith@example.com'
  },
  {
    name: 'Alice Johnson',
    license_number: 'ABCDEF12',
    vehicle_type: 'Sedan',
    phone: '555-555-5557',
    email: 'alice.johnson@example.com'
  },
  {
    name: 'Bob Brown',
    license_number: 'XYZ12345',
    vehicle_type: 'Truck',
    phone: '555-555-5558',
    email: 'bob.brown@example.com'
  },
  {
    name: 'Eve Davis',
    license_number: 'PQRS6789',
    vehicle_type: 'SUV',
    phone: '555-555-5559',
    email: 'eve.davis@example.com'
  }
]

drivers_data.each do |driver_params|
  Driver.create!(driver_params)
end