class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/all_doctors' do
    doctors = Doctor.all
    doctors.to_json
  end
  

end
