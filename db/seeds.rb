require 'faker'
puts "🌱 Seeding data..."

  #Making data for "doctors"table in database
  def generate_doctor_data(count)
    count.times.map do
      name = Faker::Name.name
      rating = rand(1..5)
      sex = Faker::Gender.binary_type.capitalize
  
      Doctor.create(name: name, rating: rating, sex: sex)
    end
  end
  
  # Generate data for 50 doctors
  doctors_data = generate_doctor_data(50)
  
  # Print the generated data
  doctors_data.each do |doctor|
    puts "Name: #{doctor.name}, Rating: #{doctor.rating}, Sex: #{doctor.sex}"
  end


  #Making data for "patients" table in database
  def generate_patient_data(count)
    count.times.map do
      name = Faker::Name.name
      age = Faker::Number.between(from: 1, to: 110)
      condition = Faker::Boolean.boolean ? 'Mild' : 'Critical'
      sex = Faker::Gender.binary_type.capitalize
  
      Patient.create(name: name, age: age, condition: condition, sex: sex)
    end
  end
  
  # Generate data for 200 patients
  patients_data = generate_patient_data(200)
  
  # Print the generated data
  patients_data.each do |patient|
    puts "Name: #{patient.name}, Age: #{patient.age}, Condition: #{patient.condition}, Sex: #{patient.sex}"
  end

  #Making data for "appointments" table in database
  appointment_dates = []
durations = []

200.times do
  appointment_dates << Faker::Date.between(from: Date.today, to: Date.today + 30)
  durations << Faker::Number.between(from: 15, to: 60)
end

200.times do |index|
  Appointment.create(
    doctor_id: Faker::Number.between(from: 1, to: 50),
    patient_id: Faker::Number.between(from: 1, to: 200),
    appointment_date: appointment_dates[index],
    duration: durations[index]
  )
end
puts "✅ Done seeding!"
