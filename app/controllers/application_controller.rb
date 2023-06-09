class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  
  #GET requests READ
  
  get "/" do
    "Welcome to the appointment booking system!"
  end
  
  

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
    # Retrieve the patient name from the request parameters
    patient_name = params[:name]
  
    # Find a doctor to assign the appointment
    doctor = Doctor.order('RANDOM()').first
  
    # Create a new patient
    patient = Patient.create(name: patient_name)
  
    # Create the new appointment
    new_appointment = Appointment.create(
      patient_name: patient_name,
      patient_id: patient.id,
      doctor_id: doctor.id,
      doctor_name: doctor.name,
      appointment_date: Faker::Date.between(from: Date.today, to: Date.today + 30),
      duration: Faker::Number.between(from: 15, to: 60)
    )
  
    new_appointment.to_json
  end

  #Delete appointment record by params
  delete '/appointments/:patient_name' do
    # Retrieve the patient name from the request parameters
    patient_name = params[:patient_name]
    
    # Find the appointment with the matching patient name
    appointments = Appointment.where(patient_name: patient_name)
    
    # Delete the appointment
    appointments.destroy_all
    
    "Appointments with patient name '#{patient_name}' have been deleted."
  end
     

end
