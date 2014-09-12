class AdminsController < ApplicationController
	def index
		@admins = Admin.order("id DESC").page(params[:page]).per(1)
	end
end
