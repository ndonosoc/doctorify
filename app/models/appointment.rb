class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: "User", foreign_key: "doctor_id"
  belongs_to :patient, class_name: "User", foreign_key: "patient_id"
  has_many :reviews, class_name: "Review", foreign_key: "review_id"
  validates :doctor_id, presence: true
  validates :patient_id, presence: true
  validates :appointment_date, presence: true
end
