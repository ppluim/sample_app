# == Schema Information
#
# Table name: userts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Usert < ActiveRecord::Base
  # ===== Modifiers =====

  attr_accessible :email, :name, :password, :password_confirmation

  # ===== Validations =====

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  # ===== Secure password =====

  has_secure_password

  # ===== Normalize email =====

  before_save { |usert| usert.email = email.downcase }
end
