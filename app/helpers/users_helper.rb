module UsersHelper

    def prints_pdf
    	respond_to do |format|
      		format.html
      		format.pdf do
        		pdf = ReportPdf.new(@users)
        		send_data pdf.render, filename: 'users_report.pdf', type: 'application/pdf'
      		end
      		format.xls {send_data @users.to_csv(col_sep: "\t")}
      		format.xlsx {
    			response.headers['Content-Disposition'] = 'attachment; filename="Inventory_Managers.xlsx"'
 			}
    	end
    end
end
