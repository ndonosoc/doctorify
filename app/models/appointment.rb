class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: "User", foreign_key: "doctor_id"
  belongs_to :patient, class_name: "User", foreign_key: "patient_id"
  has_one :review
  validates :doctor_id, presence: true
  validates :patient_id, presence: true
  validates :appointment_date, presence: true
  validate :appointment_date_after_current_date
end

private

def appointment_date_after_current_date
  if self.appointment_date < DateTime.now - 1
    return errors.add("#{self.appointment_date} must be after today")
  end
end
