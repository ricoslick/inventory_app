class ReportPdf < Prawn::Document

	def initialize(users)

		super()

		@users = users

		header

		table_content
	end


	def header
		# This inserts an image in the pdf file and sets the size of the image
		image "#{Rails.root}/app/assets/images/header_inf.png", width: 512, height:103 
	end

	def table_content
		# this makes a call to product_rows and gets back an array of data that will populate it
		move_down 20

		table product_rows do 
			row(0).font_style = :bold
			columns(1..3).align = :right

			self.header = true

			self.row_colors = ['DDDDDD', 'FFFFFF']
		end
	end

	def product_rows

		[["Name", "Email", "Department"]] +
		@users.map do |user|
			[user.name, user.email, user.department ]
		end
	end
end