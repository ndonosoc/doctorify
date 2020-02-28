require "faker"
puts "Destroying everything"
Review.destroy_all
Appointment.destroy_all
User.destroy_all

puts "creating users"
15.times do

  specialization_array = %w(dentist gynecologist generalist psychologist ophtalmologist)
     User.create(
      password: "123456",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: "#{Faker::Name.first_name}@gmail.com",
      dni: Faker::IDNumber.chilean_id,
      address: "Buenos Aires",
      location: "Buenos Aires",
      specialization: specialization_array.sample,
      age: rand(20..80),
      phone_number: Faker::PhoneNumber.phone_number,
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









