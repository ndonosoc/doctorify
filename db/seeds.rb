# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying everything"
Review.destroy_all
Appointment.destroy_all
User.destroy_all

puts "creating users"
5.times do

  specialization_array = %w(dentist gynecologist generalist)
     User.create(
      password: "123456",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: "#{Faker::Name.first_name}@gmail.com",
      dni: Faker::IDNumber.chilean_id,
      location: "Buenos Aires",
      specialization: specialization_array.sample,
      age: rand(20..80),
      phone_number: Faker::PhoneNumber,
      category: true,
      reference_number: rand(500..1000),
      )
  print "."
end

5.times do

    User.create(
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{Faker::Name.first_name}@gmail.com",
    dni: Faker::IDNumber.chilean_id,
    address: "Buenos Aires",
    location: "Buenos Aires",
    specialization: nil,
    age: rand(20..80),
    phone_number: Faker::PhoneNumber,
    category: false,
    reference_number: nil,
    )
  print "."
end

puts "creating appointments"
20.times do

  Appointment.create(
    appointment_date: DateTime.now,
    patient_id: User.where(category: false).pluck(:id).sample,
    doctor_id: User.where(category: true).pluck(:id).sample,
    )
  print "."
end

puts "creating reviews"
10.times do

    Review.create(
    rating: rand(1..5),
    content: Faker::Lorem.sentences(number: 1),
    appointment_id: Appointment.all.pluck(:id).sample,
    )
  print "."
end









