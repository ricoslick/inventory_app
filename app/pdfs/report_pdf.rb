class ReportPdf < Prawn::Document

	def initialize(users)

		super()

		@users = users

		header

		table_content
	end


	def header(title='Inventory Managers')
		# This inserts an image in the pdf file and sets the size of the image
		image "#{Rails.root}/app/assets/images/header_inf.png", width: 512, height:103 

		move_down font.height * 3

		if title
			text title, size: 14, style: :bold_italic, align: :center
		end
	end

	def table_content
		# this makes a call to product_rows and gets back an array of data that will populate it
		move_down 20

		table product_rows do 
			row(0).font_style = :bold
			columns(1..2).align = :right

			self.header = true

			self.row_colors = ['DDDDDD', 'FFFFFF']

			self.cell_style = {:size => 9}

			self.position = :center
		end
	end

	def product_rows

		[["Name", "Email", "Department"]] +
		@users.map do |user|
			[user.name, user.email, user.department ]
		end
	end
end