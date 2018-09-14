class InventoryPdf < Prawn::Document

	def initialize(devices)

		super()

		@devices = devices

		header

		table_content
	end


	def header(title='Inventory List')
		# This inserts an image in the pdf file and sets the size of the image
		image "#{Rails.root}/app/assets/images/header_inf.png", width: 512, height:103

		move_down font.height * 2
		
		if title
			text title, size: 14, style: :bold_italic, align: :center
		end
	end

	def table_content
		# this makes a call to product_rows and gets back an array of data that will populate it
		move_down 20

		table device_rows do 
			row(0).font_style = :bold
			columns(1..8).align = :center

			self.header = true

			self.row_colors = ['DDDDDD', 'FFFFFF']
		end
	end

	def device_rows

		[["Added_By", "Type", "Make", "Model", "Device Custodian", "Serial No.", "Date Created"]] +
		@devices.map do |device|
			[device.user.name, device.category, device.make, device.model, device.customer.name, device.serial, device.created_at.to_s]
		end
	end
end