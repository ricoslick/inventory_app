class Device < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  
  validates(:user_id, presence: true)
  validates(:category, presence: true)
  validates(:make, presence: true)
  validates(:model, presence: true)
  validates(:serial, presence: true, uniqueness: { case_sensitive: false })
  validates(:customer_id, presence: true)

	def self.search(query)
		where("model || make || category ILIKE ?", "%#{query}%")
	end
end
