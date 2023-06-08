class Delete2Columns < ActiveRecord::Migration[6.1]
  def change
    remove_column :appointments, :patient_name, :string
    remove_column :appointments, :doctor_name, :string
  end
end
