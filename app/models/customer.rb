class Customer < ApplicationRecord
	include ActiveModel::ForbiddenAttributesProtection
	belongs_to :user
	validates(:name, presence: true, uniqueness: { case_sensitive: false })
	validates(:department, presence: true)
	validates(:user_id, presence: true)
end
