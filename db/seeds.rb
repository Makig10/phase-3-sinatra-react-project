require 'faker'
puts "🌱 Seeding data..."

# Making data for "doctors" table in the database
def generate_doctor_data(count)
  count.times.map do
    name = Faker::Name.name
    rating = rand(1..5)
    sex = Faker::Gender.binary_type.capitalize

    Doctor.create(name: name, rating: rating, sex: sex)
  end
end

# Generate data for 100 doctors
doctors_data = generate_doctor_data(100)

# Print the generated data
doctors_data.each do |doctor|
  puts "Name: #{doctor.name}, Rating: #{doctor.rating}, Sex: #{doctor.sex}"
end


# Making data for "patients" table in the database
def generate_patient_data(count)
  count.times.map do
    name = Faker::Name.name
    age = Faker::Number.between(from: 1, to: 110)
    condition = Faker::Boolean.boolean ? 'Mild' : 'Critical'
    sex = Faker::Gender.binary_type.capitalize

    Patient.create(name: name, age: age, condition: condition, sex: sex)
  end
end

# Generate data for 50 patients
patients_data = generate_patient_data(50)

# Print the generated data
patients_data.each do |patient|
  puts "Name: #{patient.name}, Age: #{patient.age}, Condition: #{patient.condition}, Sex: #{patient.sex}"
end

# Accessing existing doctors and patients data
doctors = Doctor.all
patients = Patient.all

# Seed data for the appointments table
30.times do
  
  doctor = Doctor.order('RANDOM()').first
  patient = Patient.order('RANDOM()').first
  patient_name = patient[:name]
  doctor_name = doctor[:name]
  appointment_date = Faker::Date.between(from: Date.today, to: Date.today + 30)
  duration = Faker::Number.between(from: 15, to: 60)
  

  Appointment.create(
    doctor_id: doctor.id,
    patient_id: patient.id,
    appointment_date: appointment_date,
    duration: duration
  )
end

puts "✅ Appointments seeded successfully!"



puts "✅ Done seeding!"
