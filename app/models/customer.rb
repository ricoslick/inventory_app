class Customer < ApplicationRecord
	include ActiveModel::ForbiddenAttributesProtection
	include PgSearch

	pg_search_scope :search, against: [:name, :department],
		using: {tsearch: {any_word: true} }

	belongs_to :user

	has_many :devices
	
	validates(:name, presence: true, uniqueness: { case_sensitive: false })
	validates(:department, presence: true)
	validates(:user_id, presence: true)

	def self.search(query)
		where("name || department ILIKE ?", "%#{query}%") 
	end
end
