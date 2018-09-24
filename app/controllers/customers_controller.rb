class CustomersController < ApplicationController

	before_action :signed_in_user, only: [:create, :destroy, :edit, :update, :index, :show]
	

	def new
		@customer = Customer.new
	end

	def show
		@customers = Customer.all.paginate(page: params[:page], per_page: 5) 
	end

	def create
		@customer = current_user.customers.build(customer_params)
		if @customer.save
			flash.now[:success] = "Device User added!"
			render 'show'
		else
			render 'new'
		end
	end

	def destroy
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update_attributes(customer_params)
			# Handle a successful update
		 	flash[:success] = "Device User details updated"
		 	redirect_to customers_path
		else
			render 'edit'
		end
	end

	def index
		@customers = Customer.all.paginate(page: params[:page], per_page: 5)
		# pg search query block
		if params[:query].present?
			@customers = Customer.search(params[:query]).paginate(page: params[:page], per_page: 5)
			render 'index'
		else
			@customers
		end
	end



	private

	def customer_params
		params.require(:customer).permit(:name, :department, :user_id, :query)
	end
end
