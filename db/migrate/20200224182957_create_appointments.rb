class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_date
      t.bigint :patient_id, foreign_key: true
      t.bigint :doctor_id, foreign_key: true

      t.timestamps
    end
  end
end
