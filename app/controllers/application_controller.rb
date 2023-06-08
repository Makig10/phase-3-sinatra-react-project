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
    appointments=Appointment.all
    appointments.to_json
  end
  
  #POST requests CREATE
  post '/book_appointment' do
    new_appointment = Appointment.create()
  end

end
