class DevicesController < ApplicationController
	require 'csv'
  	require 'prawn'
  	require 'prawn/table'

	before_action :signed_in_user, only: [:create, :destroy, :edit, :update]

	def new
		@device = Device.new
		@devices = Device.all
		pdf_printer
	end

	def show
		@devices = Device.all
		# pdf_printer
	end

	def create
		@device = current_user.devices.build(device_params)
		if @device.save
			flash.now[:success] = "Device added to Inventory List"
			render 'show'
		else
			render 'new'
		end
	end

	def destroy
		@device = Device.find(params[:id])
		if @device.present?
			@device.destroy
		end
		flash[:success] = "Device removed from Inventory successfully"
		redirect_to request.referrer || inventory_path
	end

	def index
		@devices = Device.all
		pdf_printer
	end

	def edit
		@device = Device.find(params[:id])
	end

	def update
		@device = Device.find(params[:id])
		if @device.update_attributes(device_params)
			# Handle a successful update
		 	flash[:success] = "Device details updated"
		 	redirect_to inventory_path
		else
			render 'edit'
		end
	end




	private

	def device_params
		params.require(:device).permit(:category, :user_id, :make, :model, :serial, :customer_id)
	end
end
