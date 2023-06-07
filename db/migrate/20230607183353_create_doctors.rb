class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :rating
      t.string :sex
      t.timestamps
    end
  end
end
  

