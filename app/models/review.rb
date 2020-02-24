class Review < ApplicationRecord
  belongs_to :appointment
  has_one :doctor, through: :appointment
  has_one :patient, through: :appointment
  validates :rating, presence: true
  validates :content, presence: true
  validates :appointment_id, presence: true, uniqueness: true
end
