class DevicesController < ApplicationController

	before_action :signed_in_user, only: [:create, :destroy]

	def new
		@device = Device.new
	end

	def create
		@device = current_user.devices.build(device_params)
		if @device.save
			flash[:success] = "Device added to Inventory List"
			redirect_to user
		else
			render 'new'
		end
	end

	def destroy
	end

	private

	def device_params
		params.require(:device).permit(:type, :make, :model, :serial)
	end
end
