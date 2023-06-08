#deleting the 'doctor_name' and patient name column to the 'appointments' table
class Update2Appointments < ActiveRecord::Migration[6.1]
  def change
    remove_column :appointments, :patient_name, :string
    remove_column :appointments, :doctor_name, :string
  end
end

#redundant file coz ive done this in the delete2...migration file