# Migration to add the 'patient_name' column to the 'appointments' table
class UpdateAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :patient_name, :string
  end
end
