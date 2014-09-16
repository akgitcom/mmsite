class AdminsController < ApplicationController
  include(AdminsHelper)
	def index
		@admins = Admin.order("id DESC").page(params[:page]).per(1)
  end
  def new
    @admin = Admin.new
  end
  def create
    @admins = params[:admin]
    @admins[:sbpass] = Digest::MD5.hexdigest(@admins[:sbpass])
    @admins[:sblock] = 0
    @admins[:current_login_date]= Time.now.utc.to_i()
    @admins[:last_login_date] = ''
    @admins[:last_login_ip]= request.remote_ip
    @admins[:last_login_area] = get_location['country']

    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to action: 'index'
    else
      render "new"
    end
  end
  def show
    @admins = Admin.find(params[:id])
  end
  def admin_params
    params.require(:admin).permit(
        :sbname,:sbpass,:sbemail,:sblock,:current_login_date,:last_login_date,:last_login_ip,:last_login_area
    )
  end
end
