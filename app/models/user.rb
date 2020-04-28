# frozen_string_literal: true

class User < ApplicationRecord
  before_save { self.eamil = eamil.downcase }

  validates :first_name, presence: true, length: { minimum: 3, maximum: 100 }

  validates :last_name, presence: true, length: { minimum: 3, maximum: 100 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :eamil, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  has_secure_password
end
