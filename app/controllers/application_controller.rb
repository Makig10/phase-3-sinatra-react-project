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

  #POST requests (CREATE)
  post '/book_appointment' do
    # Extract the necessary parameters from the request
    doctor_name = params[:doctor_name]
    patient_name = params[:patient_name]
    appointment_date = params[:appointment_date]
  
    # Find an available doctor to assign the patient to
    doctor = Doctor.includes(:patients).where('patients.id IS NULL').first
  
    # If there are no available doctors, handle the case accordingly
    if doctor.nil?
      return { error: 'No available doctors to assign the patient to.' }.to_json
    end
  
    # Create the new patient record
    patient = Patient.create(name: patient_name)
  
    # Create the new appointment and assign it to the doctor and patient
    new_appointment = Appointment.create(
      doctor_name: doctor.name,
      patient_name: patient_name,
      appointment_date: appointment_date,
      doctor_id: doctor.id,
      patient_id: patient.id
    )
  
    # Return the newly created appointment as JSON response
    new_appointment.to_json
  end
end
