require 'faker'
puts "🌱 Seeding data..."

  # Seed your database here
def generate_patient_data(count)
    patients = []
    
    count.times do
      name = Faker::Name.name
      age = Faker::Number.between(from: 1, to: 110)
      condition = Faker::Boolean.boolean ? 'Mild' : 'Critical'
      sex = Faker::Gender.binary_type.capitalize
      
      patient = {
        name: name,
        age: age,
        condition: condition,
        sex: sex
      }
      
      patients << patient
    end
    
    patients
   end
  
  # Generate data for 200 patients
  patients_data = generate_patient_data(200)
  
  # Print the generated data
  patients_data.each do |patient|
    puts "Name: #{patient[:name]}, Age: #{patient[:age]}, Condition: #{patient[:condition]}, Sex: #{patient[:sex]}"
end

def generate_doctor_data(count)
    doctors = []
    
    count.times do
      name = Faker::Name.name
      rating = rand(1..5)
      sex = Faker::Gender.binary_type.capitalize
      
      doctor = {
        name: name,
        rating: rating,
        sex: sex
      }
      
      doctors << doctor
    end
    
    doctors
  end
  
  # Generate data for 50 doctors
  doctors_data = generate_doctor_data(50)
  
  # Print the generated data
  doctors_data.each do |doctor|
    puts "Name: #{doctor[:name]}, Rating: #{doctor[:rating]}, Sex: #{doctor[:sex]}"
  end

  appointment_dates = []
  durations = []

  patient_names.each do |patient_name|
    appointment_dates << Faker::Date.between(from: Date.today, to: Date.today + 30) # Generate random appointment date within the next 30 days
    durations << Faker::Number.between(from: 15, to: 60) # Generate random appointment duration between 15 and 60 minutes
  end

puts "✅ Done seeding!"
