class Customer < ApplicationRecord
	include ActiveModel::ForbiddenAttributesProtection
	belongs_to :user

	has_many :devices
	
	validates(:name, presence: true, uniqueness: { case_sensitive: false })
	validates(:department, presence: true)
	validates(:user_id, presence: true)
end
