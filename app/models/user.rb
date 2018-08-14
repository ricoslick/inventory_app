class User < ApplicationRecord
	include ActiveModel::ForbiddenAttributesProtection

	has_secure_password
	has_attached_file :avatar

	attr_accessor :activation_token
	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token
	before_create :create_activation_digest
	
	validates(:name, presence: true, length: { maximum: 50 })
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:email, presence: true,
	 format: { with: VALID_EMAIL_REGEX },
	 uniqueness: {case_sensitive: false})
	validates(:password, presence: true, length: { minimum: 6 })
	validates(:password_confirmation, presence: true)
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	# Activates an account.
  	def activate
    	update_attribute(:activated,    true)
    	update_attribute(:activated_at, Time.zone.now)
  	end

  	# Sends activation email.
  	def send_activation_email
    	UserMailer.account_activation(self).deliver_now
  	end

	
	private

		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end

		def create_activation_digest
    		self.activation_token = SecureRandom.urlsafe_base64
  		end
end

