class User < ActiveRecord::Base
	has_secure_password
	validates_uniqueness_of :email
	before_save { |user| user.email = email.downcase }
	validates :password, confirmation: true, length: { minimum: 6, unless: "password.blank?", too_short: "is too short (must be at least 6 characters)" }
end
