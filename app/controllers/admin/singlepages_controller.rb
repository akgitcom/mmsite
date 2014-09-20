class Admin::SinglepagesController < Admin::ApplicationController
  before_filter :authenticate_user!
  def index
    @singlepages = Singlepage.order("sid DESC").page(params[:page]).per(5)
    @title = 'singlepage manage'
  end
  def show
    @singlepage = Singlepage.find_by_sid(params[:id])
  end
  def edit
    @singlepage = Singlepage.find_by_sid(params[:id])
  end
end
