module DevicesHelper

	def pdf_printer
    	respond_to do |format|
      		format.html
      		format.pdf do
        		pdf = InventoryPdf.new(Device.all)
        		send_data pdf.render, filename: 'inventory_report.pdf', type: 'application/pdf'
      		end
      		format.xls {send_data (Device.all).to_csv(col_sep: "\t")}
      		format.xlsx {
    			response.headers['Content-Disposition'] = 'attachment; filename="Inventory_List.xlsx"'
 			}
    	end
    end
end
