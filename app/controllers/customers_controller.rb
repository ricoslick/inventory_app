class CustomersController < ApplicationController

	before_action :signed_in_user, only: [:create, :destroy]

	def new
		@customer = Customer.new
	end

	def show
		@customers = Customer.all 
	end

	def create
		@customer = current_user.customers.build(customer_params)
		if @customer.save
			flash[:success] = "Device User added!"
			render 'show'
		else
			render 'new'
		end
	end

	def destroy
	end

	def index
		@customers = Customer.all
	end



	private

	def customer_params
		params.require(:customer).permit(:name, :department, :user_id)
	end
end
