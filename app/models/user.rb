class User < ApplicationRecord
	include ActiveModel::ForbiddenAttributesProtection

	has_secure_password
	has_attached_file :avatar

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token
	
	validates(:name, presence: true, length: { maximum: 50 })
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates(:email, presence: true,
	 format: { with: VALID_EMAIL_REGEX },
	 uniqueness: {case_sensitive: false})
	validates(:password, presence: true, length: { minimum: 6 })
	validates(:password_confirmation, presence: true)
	validates(:avatar, attachment_presence: true)
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	validates_with(AttachmentPresenceValidator, attributes: :avatar)
	validates_with(AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes)


	private

		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end
