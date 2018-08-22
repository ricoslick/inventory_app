class DevicesController < ApplicationController

	before_action :signed_in_user, only: [:create]

	def new
		@device = Device.new
	end

	def show
		@devices = Device.all
	end

	def create
		@device = current_user.devices.build(device_params)
		if @device.save
			flash[:success] = "Device added to Inventory List"
			render 'show'
		else
			render 'new'
		end
	end

	#def destroy
	#end

	private

	def device_params
		params.require(:device).permit(:category, :user_id, :make, :model, :serial)
	end
end
