# adding the 'doctor_name' column to the 'appointments' table
class Update2Appointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :doctor_name, :string
  end
end