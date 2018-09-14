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

  def self.to_csv(options= {})
    CSV.generate(options) do |csv|
      csv << ["Added_By", "Type", "Make", "Model", "Device Custodian", "Serial No.", "Date Created"]
      all.each do |device|
        csv << [device.user.name, device.category, device.make, device.model, device.customer.name, device.serial, device.created_at ]
      end
    end
  end
end
