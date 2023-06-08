class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  
  #GET requests READ
  get '/all_doctors' do
    doctors = Doctor.order(rating: :desc) #  all doctors and sorts them by rating ,best to worst
    doctors.to_json
  end

  get '/all_patients' do
    patients = Patient.all
    patients.to_json
  end

  get '/best_doctors' do
    best_doctors = Doctor.order(rating: :desc).limit(10)
    best_doctors.to_json
  end

  get '/all_appointments' do
    #appointments = Appointment.all
    #appointments.to_json
    appointments = Appointment.order(id: :desc).limit(40).reverse
    appointments.to_json
  end

  post '/book_appointment' do
    patient_name = params[:name]
  
    # Find a doctor to assign the appointment
    doctor = Doctor.order('RANDOM()').first
  
    # Create a new appointment with the patient's name and assigned doctor
    new_appointment = Appointment.create(
      patient_name: patient_name,
      doctor_name: doctor.name,
      doctor_id: doctor.id,
      appointment_date: Faker::Date.between(from: Date.today, to: Date.today + 30),
      duration: Faker::Number.between(from: 15, to: 60)
    )
  
    new_appointment.to_json
  end

end
