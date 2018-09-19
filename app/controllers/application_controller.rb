class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper
  include DevicesHelper

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    sign_out_user 
  end

  private

  	# confirm a logged-in user
  	def signed_in_user
  		unless signed_in?
		    store_location
		    redirect_to signin_path, notice: "Please sign in first." 
  		end
  	end
end
