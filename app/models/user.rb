class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :appointments, class_name: "Appointment", foreign_key: 'patient_id'
  has_many :bookings, class_name: "Appointment", foreign_key: 'doctor_id'
  has_many :reviews, through: :appointments
  has_one_attached :photo

  def self.specializations
    %w(spec1 spec2)
  end

  def rating
    if reviews.count.zero?
      return false
    else
      reviews.map { |review| review.rating }.sum / reviews.count
    end
  end
end
