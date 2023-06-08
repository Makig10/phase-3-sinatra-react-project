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

# Making data for "appointments" table in the database
# Accessing existing doctors and patients data
doctors = Doctor.all
patients = Patient.all

# Seed data for the appointments table
# Assign patients to doctors
assigned_doctors = {}

patients_data.each do |patient|
  doctor = doctors_data.sample

  # Assign the patient to the doctor
  assigned_doctors[doctor.id] ||= []
  assigned_doctors[doctor.id] << patient
end

# Generate data for appointments based on the assigned doctors and patients
appointment_dates = []
durations = []

50.times do
  appointment_dates << Faker::Date.between(from: Date.today, to: Date.today + 30)
  durations << Faker::Number.between(from: 15, to: 60)
end

appointments = []

assigned_doctors.each do |doctor_id, patients|
  patients.each_with_index do |patient, index|
    appointment = Appointment.new(
      doctor_id: doctor_id,
      doctor_name: Doctor.find(doctor_id).name,
      patient_id: patient.id,
      patient_name: patient.name,
      appointment_date: appointment_dates[index],
      duration: durations[index]
    )
    appointments << appointment
  end
end

# Save the appointments
appointments.each(&:save)

# Print the appointments
appointments.each do |appointment|
  puts "ID: #{appointment.id}, Doctor ID: #{appointment.doctor_id}, Doctor Name: #{appointment.doctor_name}, Patient ID: #{appointment.patient_id}, Patient Name: #{appointment.patient_name}, Appointment Date: #{appointment.appointment_date}, Duration: #{appointment.duration}, Created At: #{appointment.created_at}, Updated At: #{appointment.updated_at}"
end

puts "✅ Done seeding!"
